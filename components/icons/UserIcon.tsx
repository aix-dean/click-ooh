import React from 'react';
import { View } from 'react-native';

interface UserIconProps {
  size?: number;
  color?: string;
}

export const UserIcon: React.FC<UserIconProps> = ({
  size = 24,
  color = '#666'
}) => {
  const strokeWidth = Math.max(1, size * 0.08);

  return (
    <View style={{ width: size, height: size, justifyContent: 'center', alignItems: 'center' }}>
      {/* Simple person icon */}
      <View style={{
        width: size * 0.8,
        height: size * 0.8,
        position: 'relative',
        justifyContent: 'center',
        alignItems: 'center'
      }}>
        {/* Head */}
        <View style={{
          width: size * 0.35,
          height: size * 0.35,
          borderRadius: size * 0.175,
          borderWidth: strokeWidth,
          borderColor: color,
          position: 'absolute',
          top: 0,
        }} />

        {/* Body */}
        <View style={{
          width: size * 0.2,
          height: size * 0.4,
          borderWidth: strokeWidth,
          borderColor: color,
          borderTopWidth: 0,
          position: 'absolute',
          bottom: 0,
        }} />
      </View>
    </View>
  );
};