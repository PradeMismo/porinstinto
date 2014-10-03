function loadSongsIntoPlayList(myPlayList){
  for (i = 0; i < gon.songs.length; i++) { 
    myPlayList.add({
      title: gon.songs[i].name,
      oga: gon.songs[i].url
    });
  };
};

$(document).ready(function(){
  var myPlayList = new jPlayerPlaylist({
    jPlayer: "#jquery_jplayer_1",
    cssSelectorAncestor: "#jp_container_1"
  }, [], {
    swfPath: "js",
    supplied: "oga",
    wmode: "window"
  });
  if ($('#jplayer_container').length){ 
    loadSongsIntoPlayList(myPlayList);
  };
});