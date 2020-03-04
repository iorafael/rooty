mapboxgl.accessToken = 'pk.eyJ1Ijoic3RlcGhhbm9mdyIsImEiOiJjazZjOGQ0aWMwcGk1M2xtdm8yOWRrbzA2In0.8TtzQLyDozmJPJFdBCdRtw';


const mapa = document.getElementById('mapa');
if (mapa){
    const paths = JSON.parse(mapa.dataset.path)
    const node = JSON.parse(mapa.dataset.node)
    const map = new mapboxgl.Map({
        container: 'mapa',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [node.longitude, node.latitude],
        zoom: 13
    });
    map.on('load', function() {
        if (Object.keys(paths).length != 0){
            for (var i = 0; i < Object.keys(paths).length; i++){
                map.addSource(`route${i}`, {
                    'type': 'geojson',
                    'data': {
                        'type': 'Feature',
                        'properties': {},
                        'geometry': {
                            'type': 'LineString',
                            'coordinates': paths[i]
                        }
                    }
                });
                map.addLayer({
                    'id': `route${i}`,
                    'type': 'line',
                    'source': `route${i}`,
                    'layout': {
                        'line-join': 'round',
                        'line-cap': 'round'
                    },
                    'paint': {
                        'line-color': '#888',
                        'line-width': 8
                    }
                });
            };
        }
    });
}