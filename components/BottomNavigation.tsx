import React from 'react';
import { View, TouchableOpacity, Text } from 'react-native';
import { HomeIcon, UserIcon } from './icons';
import { styles } from '../styles/components';

interface BottomNavigationProps {
  currentScreen: 'home' | 'account';
  onScreenChange: (screen: 'home' | 'account') => void;
}

export const BottomNavigation: React.FC<BottomNavigationProps> = ({
  currentScreen,
  onScreenChange,
}) => {
  return (
    <View style={styles.bottomNav}>
      <TouchableOpacity
        style={[styles.navItem, currentScreen === 'home' && styles.navItemActive]}
        onPress={() => onScreenChange('home')}
      >
        <View style={styles.navIconContainer}>
          <HomeIcon
            size={22}
            color={currentScreen === 'home' ? '#007bff' : '#666'}
          />
        </View>
        <Text style={[styles.navText, currentScreen === 'home' && styles.navTextActive]}>Home</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.navItem, currentScreen === 'account' && styles.navItemActive]}
        onPress={() => onScreenChange('account')}
      >
        <View style={styles.navIconContainer}>
          <UserIcon
            size={22}
            color={currentScreen === 'account' ? '#007bff' : '#666'}
          />
        </View>
        <Text style={[styles.navText, currentScreen === 'account' && styles.navTextActive]}>Account</Text>
      </TouchableOpacity>
    </View>
  );
};