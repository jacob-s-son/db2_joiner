$(document).ready ->
  $("#declaration-categories").jstree({"json_data": Tree, "plugins": ["themes", "json_data", "ui"] })
