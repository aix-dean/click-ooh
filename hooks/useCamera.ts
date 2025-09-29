import { useState, useRef, useEffect } from 'react';
import { Camera, CameraView } from 'expo-camera';
import { CameraState } from '../types';

export const useCamera = () => {
  const [hasPermission, setHasPermission] = useState<boolean | null>(null);
  const [photos, setPhotos] = useState<string[]>([]);
  const [isGallery, setIsGallery] = useState(false);
  const [currentMode, setCurrentMode] = useState<'home' | 'camera'>('home');
  const [isAttachingToReport, setIsAttachingToReport] = useState(false);
  const cameraRef = useRef<CameraView>(null);

  useEffect(() => {
    (async () => {
      const { status } = await Camera.requestCameraPermissionsAsync();
      setHasPermission(status === 'granted');
    })();
  }, []);

  const takePicture = async () => {
    if (cameraRef.current) {
      try {
        const photo = await cameraRef.current.takePictureAsync();
        if (isAttachingToReport) {
          // This will be handled by the component using the hook
          return photo.uri;
        } else {
          setPhotos(prev => [...prev, photo.uri]);
          return photo.uri;
        }
      } catch (error) {
        throw new Error('Failed to take picture');
      }
    }
  };

  const cameraState: CameraState = {
    hasPermission,
    photos,
    isGallery,
    currentMode,
    isAttachingToReport,
  };

  return {
    cameraState,
    cameraRef,
    setPhotos,
    setIsGallery,
    setCurrentMode,
    setIsAttachingToReport,
    takePicture,
  };
};