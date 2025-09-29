import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  // Bottom Navigation Styles
  bottomNav: {
    flexDirection: 'row',
    backgroundColor: '#ffffff',
    borderTopWidth: 1,
    borderTopColor: '#e0e0e0',
    paddingVertical: 8,
    paddingBottom: 8, // Reduced padding for better proportions
    minHeight: 60, // Standard mobile tab bar height
  },
  navItem: {
    flex: 1,
    alignItems: 'center',
    paddingVertical: 6,
    justifyContent: 'center',
  },
  navIconContainer: {
    marginBottom: 2,
  },
  navItemActive: {
    backgroundColor: '#f0f7ff',
  },
  navText: {
    fontSize: 11,
    color: '#666',
    fontWeight: '500',
  },
  navTextActive: {
    color: '#007bff',
    fontWeight: '600',
  },

  // Skeleton Loading Styles
  skeletonContainer: {
    padding: 20,
  },
  skeletonItem: {
    backgroundColor: '#ffffff',
    padding: 20,
    marginVertical: 8,
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  skeletonLine: {
    height: 20,
    backgroundColor: '#e0e0e0',
    borderRadius: 4,
    marginBottom: 12,
    opacity: 0.7,
  },
  skeletonLineShort: {
    height: 16,
    backgroundColor: '#f0f0f0',
    borderRadius: 4,
    width: '60%',
    opacity: 0.7,
  },
});