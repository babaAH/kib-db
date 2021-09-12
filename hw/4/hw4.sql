
/**
  Для каждого плейлиста вывести трек с наибольшей продолжительностью,
  трек с наименьшей стоимостью (если у треков одинаковая стоимость,
  то вывести тот, который весит меньше всех),
  и жанр данного плейлиста (жанром плейлиста называется тот жанр,
  треков которого больше всех в плейлисте) (playlist_name, longest_track_name,
  minimal_price_track, playlist_genre_name).
 */
select album.title, max(t.milliseconds), min(il.unit_price) from album
left join track t on album.album_id = t.album_id
left join invoice_line il on t.track_id = il.track_id
group by album.title