import React from 'react';
import { View } from 'react-native';

interface HomeIconProps {
  size?: number;
  color?: string;
}

export const HomeIcon: React.FC<HomeIconProps> = ({
  size = 24,
  color = '#666'
}) => {
  const strokeWidth = Math.max(1, size * 0.08);

  return (
    <View style={{ width: size, height: size, justifyContent: 'center', alignItems: 'center' }}>
      {/* Simple house icon */}
      <View style={{
        width: size * 0.8,
        height: size * 0.8,
        position: 'relative',
        justifyContent: 'center',
        alignItems: 'center'
      }}>
        {/* Roof */}
        <View style={{
          width: 0,
          height: 0,
          borderLeftWidth: size * 0.25,
          borderRightWidth: size * 0.25,
          borderBottomWidth: size * 0.2,
          borderLeftColor: 'transparent',
          borderRightColor: 'transparent',
          borderBottomColor: color,
          position: 'absolute',
          top: 0,
        }} />

        {/* House body */}
        <View style={{
          width: size * 0.5,
          height: size * 0.4,
          borderWidth: strokeWidth,
          borderColor: color,
          position: 'absolute',
          bottom: 0,
          borderBottomWidth: strokeWidth,
        }} />

        {/* Door */}
        <View style={{
          width: size * 0.15,
          height: size * 0.25,
          backgroundColor: color,
          position: 'absolute',
          bottom: strokeWidth,
          left: size * 0.325,
        }} />
      </View>
    </View>
  );
};