import React from 'react';
import { View, FlatList, TouchableOpacity, Text, Alert, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { ServiceAssignment, User } from '../types';
import { SkeletonItem } from '../components/SkeletonItem';
import { mainStyles as styles } from '../styles/main';

interface HomeScreenProps {
  serviceAssignments: ServiceAssignment[];
  isLoadingAssignments: boolean;
  user: User;
  onAssignmentPress: (assignment: ServiceAssignment) => void;
  onLogout: () => void;
}

export const HomeScreen: React.FC<HomeScreenProps> = ({
  serviceAssignments,
  isLoadingAssignments,
  user,
  onAssignmentPress,
  onLogout,
}) => {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        {/* Sticky Header */}
        <View style={styles.stickyHeader}>
          <View style={styles.headerLeft}>
            <View style={styles.headerTextContainer}>
              <Text style={styles.headerTitle}>click ooh</Text>
              <Text style={styles.headerSubtitle}>Service Assignments</Text>
            </View>
          </View>
          <TouchableOpacity style={styles.modernLogoutButton} onPress={onLogout}>
            <Text style={styles.logoutIcon}>🚪</Text>
            <Text style={styles.modernLogoutText}>Logout</Text>
          </TouchableOpacity>
        </View>

        {/* Content Area */}
        {isLoadingAssignments ? (
          <View style={styles.contentArea}>
            <SkeletonItem />
            <SkeletonItem />
            <SkeletonItem />
            <SkeletonItem />
            <SkeletonItem />
          </View>
        ) : (
          <FlatList
            data={serviceAssignments}
            renderItem={({ item }) => (
              <TouchableOpacity
                style={styles.assignmentItem}
                onPress={() => onAssignmentPress(item)}
              >
                <Text style={styles.assignmentText}>
                  {item.saNumber} - {item.projectSiteName}
                </Text>
                <Text style={styles.assignmentSubText}>
                  {item.serviceType} - {item.status}
                </Text>
              </TouchableOpacity>
            )}
            keyExtractor={(item) => item.id}
            contentContainerStyle={styles.listContent}
            showsVerticalScrollIndicator={false}
          />
        )}
      </View>
    </SafeAreaView>
  );
};