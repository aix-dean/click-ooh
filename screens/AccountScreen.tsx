import React from 'react';
import { ScrollView, View, Text, TouchableOpacity } from 'react-native';
import { User } from '../types';
import { accountStyles as styles } from '../styles/account';

interface AccountScreenProps {
  user: User;
  onLogout: () => void;
}

export const AccountScreen: React.FC<AccountScreenProps> = ({ user, onLogout }) => {
  return (
    <ScrollView style={styles.accountContainer}>
      <View style={styles.accountHeader}>
        <View style={styles.avatarContainer}>
          <Text style={styles.avatarText}>
            {user?.phoneNumber?.slice(-2) || 'US'}
          </Text>
        </View>
        <Text style={styles.accountName}>Demo User</Text>
        <Text style={styles.accountPhone}>{user?.phoneNumber || '+63 XXX XXX XXXX'}</Text>
      </View>

      <View style={styles.accountSection}>
        <Text style={styles.sectionTitle}>Account Information</Text>
        <View style={styles.accountItem}>
          <Text style={styles.accountItemLabel}>Phone Number</Text>
          <Text style={styles.accountItemValue}>{user?.phoneNumber || '+63 XXX XXX XXXX'}</Text>
        </View>
        <View style={styles.accountItem}>
          <Text style={styles.accountItemLabel}>User ID</Text>
          <Text style={styles.accountItemValue}>{user?.uid || 'mock-user-123'}</Text>
        </View>
        <View style={styles.accountItem}>
          <Text style={styles.accountItemLabel}>Account Type</Text>
          <Text style={styles.accountItemValue}>Demo Account</Text>
        </View>
      </View>

      <View style={styles.accountSection}>
        <Text style={styles.sectionTitle}>App Information</Text>
        <View style={styles.accountItem}>
          <Text style={styles.accountItemLabel}>Version</Text>
          <Text style={styles.accountItemValue}>1.0.0</Text>
        </View>
        <View style={styles.accountItem}>
          <Text style={styles.accountItemLabel}>Environment</Text>
          <Text style={styles.accountItemValue}>Demo Mode</Text>
        </View>
      </View>

      <TouchableOpacity style={styles.logoutButtonLarge} onPress={onLogout}>
        <Text style={styles.logoutButtonTextLarge}>Logout</Text>
      </TouchableOpacity>
    </ScrollView>
  );
};