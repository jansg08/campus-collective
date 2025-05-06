"use client";

import { MapContainer, Marker, Popup, TileLayer, useMap } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import { useEffect } from "react";

export interface LeafletMapProps {
  center: [number, number];
  markerPosition?: [number, number];
  zoom?: number;
  zoomControl?: boolean;
  variant?: "" | "Accent" | "Inverted" | "AccentInverted";
  popUpContent?: string | React.ReactNode;
  borderRadius?: `${string}px`;
  expanded?: boolean;
}

const createDynamicMarker = (variant: string) =>
  new L.Icon({
    iconUrl: `/MapMarker${variant}.png`,
    iconRetinaUrl: `/MapMarker${variant}Retina.png`,
    iconSize: [55, 65],
    iconAnchor: [27.5, 70],
    popupAnchor: [0, -55],
  });

const ChangeLocation = ({ expanded }: { expanded: boolean }) => {
  const map = useMap();
  useEffect(() => {
    map.invalidateSize(true);
  }, [expanded, map]);

  return null;
};

export const LeafletMap = ({
  center,
  markerPosition = center,
  zoom = 16,
  zoomControl = true,
  variant = "",
  popUpContent,
  borderRadius = "0px",
  expanded = true,
}: LeafletMapProps) => {
  return (
    <MapContainer
      center={center}
      zoom={zoom}
      zoomControl={expanded && zoomControl}
      style={{
        height: "100%",
        width: "100%",
        borderRadius,
      }}
    >
      <TileLayer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        attribution="&copy; OpenStreetMap contributors"
      />
      <Marker position={markerPosition} icon={createDynamicMarker(variant)}>
        {popUpContent && <Popup>{popUpContent}</Popup>}
      </Marker>
      <ChangeLocation expanded={expanded} />
    </MapContainer>
  );
};
