library(osmdata)
library(osmapiR)


# Elimina el noms de les andanes ----

andanes <- opq(bbox = "relation(id:11747082)", out = "tags", timeout = 500) |>
  add_osm_feature(key = "public_transport", value = "platform") |>
  add_osm_feature(key = "name") |>
  osmdata_data_frame()

unique(andanes[, setdiff(names(andanes), c("osm_type", "osm_id"))])
lapply(andanes[, setdiff(names(andanes), c("osm_type", "osm_id"))], unique)
which(andanes$name %in% sort(unique(c(grep("^[Aa]ndana", unique(andanes$name), value=TRUE), grep("^[Bb]uzon", unique(andanes$name), value=TRUE)))))


## Aplica els canvis a OSM



# Elimina el noms de les bústies ----

busties <- opq(bbox = "relation(id:11747082)", out = "tags", timeout = 500) |>
  add_osm_feature(key = "amenity", value = "post_box") |>
  add_osm_feature(key = "name") |>
  osmdata_data_frame()

unique(busties[, setdiff(names(busties), c("osm_type", "osm_id"))])
lapply(busties[, setdiff(names(busties), c("osm_type", "osm_id"))], unique)
which(busties$name %in% sort(unique(grep("^([Bb]ústia|[Bb]uzon)", unique(busties$name), value=TRUE))))


## Aplica els canvis a OSM


# Elimina noms de bancs

bancs <- opq(bbox = "relation(id:11747082)", out = "tags", timeout = 500) |>
  add_osm_feature(key = "amenity", value = "bench") |>
  add_osm_feature(key = "name") |>
  osmdata_data_frame()

unique(bancs[, setdiff(names(bancs), c("osm_type", "osm_id"))])
lapply(bancs[, setdiff(names(bancs), c("osm_type", "osm_id"))], unique)
which(bancs$name %in% sort(unique(grep("^[Bb]anc(o)*$", unique(bancs$name), value=TRUE))))


## Aplica els canvis a OSM


# Elimina noms de parcs ----

parcs <- opq(bbox = "relation(id:11747082)", out = "tags", timeout = 500) |>
  add_osm_feature(key = "leisure", value = "park") |>
  add_osm_feature(key = "name") |>
  osmdata_data_frame()

unique(parcs[, setdiff(names(parcs), c("osm_type", "osm_id"))])
lapply(parcs[, setdiff(names(parcs), c("osm_type", "osm_id"))], unique)
which(parcs$name %in% sort(unique(grep("^([Pp]arc|[Pp]arque)$", unique(parcs$name), value=TRUE))))


## Aplica els canvis a OSM
