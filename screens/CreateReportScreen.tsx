import React, { useState, useRef, useEffect } from 'react';
import { View, Text, TouchableOpacity, TextInput, ScrollView, FlatList, Image, Alert, ActivityIndicator, Platform, Modal, PanResponder, Dimensions } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { CameraView, useCameraPermissions } from 'expo-camera';
import { ServiceAssignment, User } from '../types';
import { submitReport } from '../services/reportService';
import { mainStyles as styles } from '../styles/main';

// Status color mapping
const getStatusColor = (status: string) => {
  switch (status?.toLowerCase()) {
    case 'completed':
    case 'posted':
      return '#28a745';
    case 'in progress':
    case 'ongoing':
      return '#007bff';
    case 'pending':
      return '#ffc107';
    case 'cancelled':
      return '#dc3545';
    default:
      return '#6c757d';
  }
};

// Priority color mapping
const getPriorityColor = (priority: string) => {
  switch (priority?.toLowerCase()) {
    case 'high':
    case 'urgent':
      return '#dc3545';
    case 'medium':
      return '#ffc107';
    case 'low':
      return '#28a745';
    default:
      return '#6c757d';
  }
};

interface CreateReportScreenProps {
  assignment: ServiceAssignment;
  user: User;
  onBack: () => void;
  onReportSubmitted: () => void;
}

export const CreateReportScreen: React.FC<CreateReportScreenProps> = ({
  assignment,
  user,
  onBack,
  onReportSubmitted,
}) => {
  const [reportTitle, setReportTitle] = useState('');
  const [reportDescription, setReportDescription] = useState('');
  const [reportPhotos, setReportPhotos] = useState<{uri: string, timestamp: Date}[]>([]);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [showCamera, setShowCamera] = useState(false);
  const [currentTime, setCurrentTime] = useState(new Date());
  const [expandedPhotoIndex, setExpandedPhotoIndex] = useState<number | null>(null);
  const [permission, requestPermission] = useCameraPermissions();
  const cameraRef = useRef<CameraView>(null);

  // Update current time every second when camera is active
  useEffect(() => {
    if (showCamera) {
      const interval = setInterval(() => {
        setCurrentTime(new Date());
      }, 1000);
      return () => clearInterval(interval);
    }
  }, [showCamera]);

  const handleSubmit = async () => {
    if (!reportTitle.trim()) {
      Alert.alert('Error', 'Please enter a report title');
      return;
    }

    if (!reportDescription.trim()) {
      Alert.alert('Error', 'Please enter a report description');
      return;
    }

    setIsSubmitting(true);
    try {
      const photoUris = reportPhotos.map(photo => photo.uri);
      await submitReport(assignment, reportTitle, reportDescription, photoUris, user);
      Alert.alert('Success', 'Report submitted successfully', [
        { text: 'OK', onPress: onReportSubmitted }
      ]);
    } catch (error) {
      Alert.alert('Error', 'Failed to submit report');
    } finally {
      setIsSubmitting(false);
    }
  };

  const addPhoto = async () => {
    if (!permission) {
      const { granted } = await requestPermission();
      if (!granted) {
        Alert.alert('Permission denied', 'Camera permission is required to take photos');
        return;
      }
    }

    if (permission?.granted) {
      setShowCamera(true);
    } else {
      Alert.alert('Permission denied', 'Camera permission is required to take photos');
    }
  };

  const takePicture = async () => {
    if (cameraRef.current) {
      try {
        const photo = await cameraRef.current.takePictureAsync();
        const timestamp = new Date();
        setReportPhotos(prev => [...prev, { uri: photo.uri, timestamp }]);
        setShowCamera(false);
        Alert.alert('Photo Added', `Photo taken at ${timestamp.toLocaleString()} has been attached to the report.`);
      } catch (error) {
        Alert.alert('Error', 'Failed to take picture');
      }
    }
  };

  const openExpandedPhoto = (index: number) => {
    setExpandedPhotoIndex(index);
  };

  const closeExpandedPhoto = () => {
    setExpandedPhotoIndex(null);
  };

  const deletePhoto = (index: number) => {
    Alert.alert(
      'Delete Photo',
      'Are you sure you want to delete this photo?',
      [
        { text: 'Cancel', style: 'cancel' },
        {
          text: 'Delete',
          style: 'destructive',
          onPress: () => {
            setReportPhotos(prev => prev.filter((_, i) => i !== index));
            setExpandedPhotoIndex(null);
          }
        }
      ]
    );
  };

  const goToPreviousPhoto = () => {
    if (expandedPhotoIndex !== null && expandedPhotoIndex > 0) {
      setExpandedPhotoIndex(expandedPhotoIndex - 1);
    }
  };

  const goToNextPhoto = () => {
    if (expandedPhotoIndex !== null && expandedPhotoIndex < reportPhotos.length - 1) {
      setExpandedPhotoIndex(expandedPhotoIndex + 1);
    }
  };

  // PanResponder for swipe gestures
  const panResponder = useRef(
    PanResponder.create({
      onMoveShouldSetPanResponder: (evt, gestureState) => {
        return Math.abs(gestureState.dx) > 20;
      },
      onPanResponderRelease: (evt, gestureState) => {
        if (gestureState.dx > 50) {
          // Swipe right - previous photo
          goToPreviousPhoto();
        } else if (gestureState.dx < -50) {
          // Swipe left - next photo
          goToNextPhoto();
        }
      },
    })
  );

  // Show camera if active
  if (showCamera) {
    if (Platform.OS === 'web') {
      return (
        <SafeAreaView style={styles.safeContainer}>
          <View style={styles.container}>
            <Text>Camera not supported on web. Please use a mobile device.</Text>
            <TouchableOpacity style={styles.backButton} onPress={() => setShowCamera(false)}>
              <Text style={styles.backButtonText}>Back to Form</Text>
            </TouchableOpacity>
          </View>
        </SafeAreaView>
      );
    }

    return (
      <SafeAreaView style={styles.safeContainer}>
        <View style={styles.container}>
          <CameraView style={{ flex: 1 }} facing="back" ref={cameraRef} />

          {/* Time and Date Overlay */}
          <View style={{
            position: 'absolute',
            top: 50,
            left: 20,
            right: 20,
            alignItems: 'center',
            backgroundColor: 'rgba(0, 0, 0, 0.7)',
            borderRadius: 10,
            padding: 10,
          }}>
            <Text style={{
              color: 'white',
              fontSize: 18,
              fontWeight: 'bold',
              textAlign: 'center'
            }}>
              {currentTime.toLocaleDateString('en-US', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
              })}
            </Text>
            <Text style={{
              color: 'white',
              fontSize: 24,
              fontWeight: 'bold',
              textAlign: 'center'
            }}>
              {currentTime.toLocaleTimeString('en-US', {
                hour12: true,
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
              })}
            </Text>
          </View>

          {/* Camera Controls */}
          <View style={{ position: 'absolute', bottom: 64, left: 0, right: 0, alignItems: 'center' }}>
            <TouchableOpacity style={styles.createButton} onPress={takePicture}>
              <Text style={styles.buttonText}>📸 Take Picture</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.backButton} onPress={() => setShowCamera(false)}>
              <Text style={styles.backButtonText}>Cancel</Text>
            </TouchableOpacity>
          </View>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.safeContainer}>
      {/* Header with Back Arrow */}
      <View style={styles.stickyHeader}>
        <View style={styles.headerLeft}>
          <TouchableOpacity
            style={{
              padding: 8,
              marginRight: 8,
            }}
            onPress={onBack}
          >
            <Text style={{
              fontSize: 24,
              color: '#007bff',
              fontWeight: 'bold'
            }}>←</Text>
          </TouchableOpacity>
          <Text style={styles.headerTitle}>Create Report</Text>
        </View>
      </View>

      {/* Scrollable Content */}
      <ScrollView
        style={styles.scrollableContent}
        contentContainerStyle={styles.detailsContainer}
        showsVerticalScrollIndicator={false}
      >
        {/* Basic Information Card */}
        <View style={styles.primaryCard}>
          <Text style={styles.cardTitle}>📋 Basic Information</Text>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>SA Number:</Text>
            <Text style={styles.infoValue}>{assignment.saNumber}</Text>
          </View>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Service Type:</Text>
            <Text style={styles.infoValue}>{assignment.serviceType}</Text>
          </View>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Priority:</Text>
            <View style={styles.priorityContainer}>
              <View style={[styles.priorityDot, { backgroundColor: getPriorityColor(assignment.priority) }]} />
              <Text style={[styles.priorityText, { color: getPriorityColor(assignment.priority) }]}>
                {assignment.priority || 'Normal'}
              </Text>
            </View>
          </View>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Status:</Text>
            <View style={styles.statusBadge}>
              <View style={[styles.statusDot, { backgroundColor: getStatusColor(assignment.status) }]} />
              <Text style={[styles.statusText, { color: getStatusColor(assignment.status) }]}>
                {assignment.status || 'Unknown'}
              </Text>
            </View>
          </View>
        </View>

        {/* Location Card */}
        <View style={styles.secondaryCard}>
          <Text style={styles.cardTitle}>📍 Location & Site</Text>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Project Site:</Text>
            <Text style={styles.infoValue}>{assignment.projectSiteName}</Text>
          </View>

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Location:</Text>
            <Text style={styles.infoValue}>{assignment.projectSiteLocation}</Text>
          </View>
        </View>

        {/* Report Details Card */}
        <View style={styles.secondaryCard}>
          <Text style={styles.cardTitle}>📝 Report Details</Text>

          <TextInput
            style={styles.input}
            placeholder="Report Title"
            value={reportTitle}
            onChangeText={setReportTitle}
          />

          <TextInput
            style={styles.input}
            placeholder="Description"
            value={reportDescription}
            onChangeText={setReportDescription}
            multiline
            numberOfLines={4}
          />

          <Text style={styles.photoCount}>Attached Photos: {reportPhotos.length}</Text>
  
            {reportPhotos.length > 0 && (
              <FlatList
                horizontal
                data={reportPhotos}
                renderItem={({ item, index }) => (
                  <TouchableOpacity
                    style={{ marginRight: 10, position: 'relative' }}
                    onPress={() => openExpandedPhoto(index)}
                  >
                    <Image
                      source={{ uri: item.uri }}
                      style={{ width: 80, height: 80, borderRadius: 8 }}
                      defaultSource={require('../assets/icon.png')}
                    />
                    {/* Timestamp overlay on photo */}
                    <View style={{
                      position: 'absolute',
                      bottom: 0,
                      left: 0,
                      right: 0,
                      backgroundColor: 'rgba(0, 0, 0, 0.8)',
                      padding: 2,
                      borderBottomLeftRadius: 8,
                      borderBottomRightRadius: 8,
                    }}>
                      <Text style={{
                        color: 'white',
                        fontSize: 8,
                        fontWeight: 'bold',
                        textAlign: 'center'
                      }}>
                        {item.timestamp.toLocaleDateString()}
                      </Text>
                      <Text style={{
                        color: 'white',
                        fontSize: 8,
                        textAlign: 'center'
                      }}>
                        {item.timestamp.toLocaleTimeString([], {hour: '2-digit', minute: '2-digit'})}
                      </Text>
                    </View>
                  </TouchableOpacity>
                )}
                keyExtractor={(item, index) => index.toString()}
                showsHorizontalScrollIndicator={false}
                style={{ marginVertical: 10 }}
              />
            )}

          <TouchableOpacity style={styles.smallButton} onPress={addPhoto}>
            <Text style={styles.smallButtonText}>Attach Photos</Text>
          </TouchableOpacity>

          <View style={{ flexDirection: 'row', justifyContent: 'center', marginTop: 20, gap: 20 }}>
            <TouchableOpacity style={styles.floatingCreateButton} onPress={handleSubmit} disabled={isSubmitting}>
              <Text style={styles.floatingButtonText}>
                {isSubmitting ? 'Submitting...' : '📤 Submit Report'}
              </Text>
            </TouchableOpacity>

            <TouchableOpacity style={styles.floatingBackButton} onPress={onBack}>
              <Text style={styles.floatingButtonText}>Back</Text>
            </TouchableOpacity>
          </View>
        </View>
      </ScrollView>

      {isSubmitting && (
        <View style={styles.loadingOverlay}>
          <ActivityIndicator size="large" color="#007bff" />
          <Text style={styles.loadingText}>Submitting Report...</Text>
        </View>
      )}

      {/* Expanded Photo Modal */}
      <Modal
        visible={expandedPhotoIndex !== null}
        transparent={true}
        animationType="fade"
        onRequestClose={closeExpandedPhoto}
      >
        <View
          style={{
            flex: 1,
            backgroundColor: 'rgba(0, 0, 0, 0.9)',
            justifyContent: 'center',
            alignItems: 'center'
          }}
          {...panResponder.current.panHandlers}
        >
          {expandedPhotoIndex !== null && reportPhotos[expandedPhotoIndex] && (
            <>
              {/* Navigation Arrows */}
              {expandedPhotoIndex > 0 && (
                <TouchableOpacity
                  style={{
                    position: 'absolute',
                    left: 20,
                    top: '50%',
                    transform: [{ translateY: -25 }],
                    backgroundColor: 'rgba(0, 0, 0, 0.7)',
                    borderRadius: 25,
                    width: 50,
                    height: 50,
                    justifyContent: 'center',
                    alignItems: 'center',
                    zIndex: 10,
                  }}
                  onPress={goToPreviousPhoto}
                >
                  <Text style={{ color: 'white', fontSize: 24, fontWeight: 'bold' }}>‹</Text>
                </TouchableOpacity>
              )}

              {expandedPhotoIndex < reportPhotos.length - 1 && (
                <TouchableOpacity
                  style={{
                    position: 'absolute',
                    right: 20,
                    top: '50%',
                    transform: [{ translateY: -25 }],
                    backgroundColor: 'rgba(0, 0, 0, 0.7)',
                    borderRadius: 25,
                    width: 50,
                    height: 50,
                    justifyContent: 'center',
                    alignItems: 'center',
                    zIndex: 10,
                  }}
                  onPress={goToNextPhoto}
                >
                  <Text style={{ color: 'white', fontSize: 24, fontWeight: 'bold' }}>›</Text>
                </TouchableOpacity>
              )}

              <Image
                source={{ uri: reportPhotos[expandedPhotoIndex].uri }}
                style={{
                  width: '90%',
                  height: '70%',
                  resizeMode: 'contain'
                }}
              />

              {/* Photo Info Overlay */}
              <View style={{
                position: 'absolute',
                bottom: 120,
                left: 20,
                right: 20,
                backgroundColor: 'rgba(0, 0, 0, 0.8)',
                borderRadius: 10,
                padding: 15,
              }}>
                <Text style={{
                  color: 'white',
                  fontSize: 16,
                  fontWeight: 'bold',
                  textAlign: 'center',
                  marginBottom: 5
                }}>
                  Photo {expandedPhotoIndex + 1} of {reportPhotos.length}
                </Text>
                <Text style={{
                  color: 'white',
                  fontSize: 14,
                  textAlign: 'center'
                }}>
                  Taken: {reportPhotos[expandedPhotoIndex].timestamp.toLocaleString()}
                </Text>
              </View>

              {/* Control Buttons */}
              <View style={{
                position: 'absolute',
                bottom: 40,
                left: 20,
                right: 20,
                flexDirection: 'row',
                justifyContent: 'space-between',
                alignItems: 'center'
              }}>
                <TouchableOpacity
                  style={{
                    backgroundColor: '#dc3545',
                    paddingHorizontal: 20,
                    paddingVertical: 12,
                    borderRadius: 8,
                    flexDirection: 'row',
                    alignItems: 'center'
                  }}
                  onPress={() => deletePhoto(expandedPhotoIndex)}
                >
                  <Text style={{
                    color: 'white',
                    fontSize: 16,
                    fontWeight: 'bold',
                    marginLeft: 5
                  }}>
                    🗑️ Delete
                  </Text>
                </TouchableOpacity>

                <TouchableOpacity
                  style={{
                    backgroundColor: '#6c757d',
                    paddingHorizontal: 20,
                    paddingVertical: 12,
                    borderRadius: 8
                  }}
                  onPress={closeExpandedPhoto}
                >
                  <Text style={{
                    color: 'white',
                    fontSize: 16,
                    fontWeight: 'bold'
                  }}>
                    Close
                  </Text>
                </TouchableOpacity>
              </View>
            </>
          )}
        </View>
      </Modal>
    </SafeAreaView>
  );
};