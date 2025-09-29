import React from 'react';
import { View } from 'react-native';
import { styles } from '../styles/components';

export const SkeletonItem: React.FC = () => (
  <View style={styles.skeletonItem}>
    <View style={styles.skeletonLine} />
    <View style={styles.skeletonLineShort} />
  </View>
);