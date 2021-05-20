CREATE OR REPLACE FUNCTION layer_traffic_signals(bbox geometry, zoom_level integer)
    RETURNS TABLE
            (
                osm_id      bigint,
                geometry    geometry
            )
AS
$$
SELECT
    osm_id,
    geometry
FROM osm_traffic_signals
WHERE zoom_level >= 14
  AND geometry && bbox;
$$ LANGUAGE SQL STABLE
                -- STRICT
                PARALLEL SAFE;
