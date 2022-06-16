import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    console.log(JSON.parse(this.markersValue[0]));
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    console.log("markers successfully loaded");
    const popup = new mapboxgl.Popup().setHTML(
      JSON.parse(this.markersValue).info_window
    ); // add this
    new mapboxgl.Marker()
      .setLngLat([
        JSON.parse(this.markersValue[0]).lng,
        JSON.parse(this.markersValue[0]).lat,
      ])
      .addTo(this.map)
      .setPopup(popup)
      .togglePopup(); // add this
  }

  #fitMapToMarkers() {
    console.log("fit map successfuly loaded");

    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([
        JSON.parse(this.markersValue[0]).lng,
        JSON.parse(this.markersValue[0]).lat,
      ])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 16, duration: 1000 });
  }
}
