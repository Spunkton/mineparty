# These are the setup items from Sulfurball
# All of these are just markers for marking locations.

# Tag glossary:
# > Identifier tag (eg. sulfurball_start_pink), these are just used to identify the tag (tp @a[team=pink] @n[sulfurball_start_pink])
# > Visual tag (Every tag starting with "minigame_"). These determine how the markers are shown when editing. The available tags for these are: "minigame_start" (ender pearl), "minigame_spawn" (bed), "minigame_lobby" (lectern), "minigame_blue", "minigame_pink", "minigame_green", "minigame_red".
# > "singular" and "new" are used to make sure there is exactly one of the markers with the "singular_id" at all times.


# start
give @p axolotl_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_start_pink","minigame_start","singular","new"],data:{singular_id:"sulfurball_start_pink"}},item_name="Sulfurball Start Marker (Pink)",custom_data={editor_tool:true}] 1
give @p allay_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_start_blue","minigame_start","singular","new"],data:{singular_id:"sulfurball_start_blue"}},item_name="Sulfurball Start Marker (Blue)",custom_data={editor_tool:true}] 1

# lobby
give @p pufferfish_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_lobby","minigame_lobby","singular","new"],data:{singular_id:"sulfurball_lobby"}},item_name="Sulfurball Lobby",custom_data={editor_tool:true}] 1

# game
### Scoreboard is not singular!!
give @p squid_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_scoreboard","minigame_green"]},item_name="Sulfurball Scoreboard",custom_data={editor_tool:true}] 1
give @p shulker_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_goal_pink","minigame_pink","singular","new"],data:{singular_id:"sulfurball_goal_pink"}},item_name="Sulfurball Goal (Pink)",custom_data={editor_tool:true}] 1
give @p breeze_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_goal_blue","minigame_blue","singular","new"],data:{singular_id:"sulfurball_goal_blue"}},item_name="Sulfurball Goal (Blue)",custom_data={editor_tool:true}] 1
give @p tropical_fish_spawn_egg[entity_data={id:"minecraft:marker",Tags:["sulfurball_center","minigame_start","singular","new"],data:{singular_id:"sulfurball_center"}},item_name="Sulfurball Center",custom_data={editor_tool:true}] 1