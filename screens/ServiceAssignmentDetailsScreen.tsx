import React from 'react';
import { View, Text, TouchableOpacity, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { ServiceAssignment } from '../types';
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

interface ServiceAssignmentDetailsScreenProps {
  assignment: ServiceAssignment;
  onCreateReport: () => void;
  onBack: () => void;
}

export const ServiceAssignmentDetailsScreen: React.FC<ServiceAssignmentDetailsScreenProps> = ({
  assignment,
  onCreateReport,
  onBack,
}) => {
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
          <Text style={styles.headerTitle}>Service Assignment Details</Text>
        </View>
      </View>

      {/* Scrollable Content */}
      <ScrollView
        style={styles.scrollableContent}
        contentContainerStyle={styles.detailsContainer}
        showsVerticalScrollIndicator={false}
      >
        {/* Status Badge */}
        <View style={styles.headerSection}>
          <View style={styles.statusBadge}>
            <View style={[styles.statusDot, { backgroundColor: getStatusColor(assignment.status) }]} />
            <Text style={[styles.statusText, { color: getStatusColor(assignment.status) }]}>
              {assignment.status || 'Unknown'}
            </Text>
          </View>
        </View>

        {/* Primary Information Card */}
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

          {/* Assignment Card */}
          <View style={styles.secondaryCard}>
            <Text style={styles.cardTitle}>👷 Assignment Details</Text>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Assigned To:</Text>
              <Text style={styles.infoValue}>{assignment.assignedToName}</Text>
            </View>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Equipment:</Text>
              <Text style={styles.infoValue}>{assignment.equipmentRequired || 'Not specified'}</Text>
            </View>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Crew:</Text>
              <Text style={styles.infoValue}>{assignment.crew || 'Not specified'}</Text>
            </View>
          </View>

          {/* Technical Card */}
          <View style={styles.secondaryCard}>
            <Text style={styles.cardTitle}>⚙️ Technical Specifications</Text>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Technology:</Text>
              <Text style={styles.infoValue}>{assignment.technology || 'Not specified'}</Text>
            </View>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Illumination:</Text>
              <Text style={styles.infoValue}>{assignment.illuminationNits || 'Not specified'}</Text>
            </View>

            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Material Specs:</Text>
              <Text style={styles.infoValue}>{assignment.materialSpecs || 'Not specified'}</Text>
            </View>
          </View>

          {/* Bottom spacing for floating buttons */}
          <View style={styles.bottomSpacing} />
        </ScrollView>

        {/* Floating Action Buttons */}
        <View style={styles.floatingButtonContainer}>
          <TouchableOpacity style={styles.floatingCreateButton} onPress={onCreateReport}>
            <Text style={styles.floatingButtonText}>📝 Create Report</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.floatingBackButton} onPress={onBack}>
            <Text style={styles.floatingButtonText}>Back</Text>
          </TouchableOpacity>
        </View>
    </SafeAreaView>
  );
};