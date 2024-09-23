/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = -1 // 0 Dawn, 1 Morning, 2 Noon, 3 Sunset, 4 Night
VAR walking_stick = 0
VAR preference = ""

-> choice

== choice ==
The question your friend asked you lingered in your mind for a moment. Were you more of a beach person or a mountain person?
* [Beaches definitely]
    ~ preference = "beaches"
    -> trail
* [Gotta be mountains]
    ~ preference = "mountains"
    -> trail

== trail ==
The dirt path continues for a while longer, light shines in the distance.
* [Walk forwards] -> meadow1

== meadow1 ==
The trail opens up to the vast meadow. Tall grass sways through the breeze. The meadow continues north and east.
+ [Go North] -> meadow2
+ [Go East] -> meadow3

== meadow2 ==
The grass is shorter and more sparce, the meadow leads east and south, it also ends a bit further north.
+ [Go North] -> beach1
+ [Go East] -> meadow4
+ [Go South] -> meadow1

== meadow3 ==
The meadow looks much the same here. Some butterflies are flying around the taller plants. The meadow continues north and west from here.
+ [Go North] -> meadow4
+ [Go West] -> meadow1

== meadow4 ==
The meadow starts to give way to a forest eastwards, the grass is thick and is a bit restricting. The meadow continues to the west and south.
+ [Go East] -> forest1
+ [Go South] -> meadow3
+ [Go West] -> meadow2

== beach1 ==
The grass begins a gradient change to sand. In the distance a pond in a valley can be seen.
+ [Go North] -> beach2
+ [Go South] -> meadow2

== beach2 ==
You find yourself at the foot of a pond. Mountains stretch up high all around the water, creating a beautiful secluded alcove. {&The sunrise paints the sky in the prettiest pink|The sun peaks over some of the mountains casting rays of light on the pond|The sun beams down on the pond making it glisten with thousands of sparkles|The mountains are silhoetted against the deep orange sky|The stars and moon reflect off the pond elegantly}. {not stick:You can see a piece of driftwood has reached the shore.}
+ [Wait awhile] -> sit
* [Take Stick] -> stick
+ [Go Back] -> beach1

== sit ==
You sit down and enjoy the view.
-> beach2

== stick ==
~ walking_stick = walking_stick + 1
You pick up the stick.
-> beach2

== forest1 ==
The verdant forest has a trail in it that leads up and to the north.
+ [Go North] -> forest2
+ [Go West] -> meadow4

== forest2 ==
The trail splits as the forest grows thicker. The path to the north seems to go further into the forest and the path to the east leads steeply upwards, it may be hard to navigate without some help.
* [Go North] -> forest3
* {walking_stick > 0} [Go East] -> mountain
+ [Go South] -> forest1

== forest3 ==
The forest grows even thicker until it eventually gets too hard to navigate, nature has completely overtaken the path ahead.
* [Go Back] -> forest2

== mountain ==
The trek upwards was rough but the driftwood you found helped make it manageable. The summit is close ahead. If you hurry {&you can see the sunrise|you can see the sun bathe rays across the world|you'll get to see the view as its brightest|you can watch the sun set|you'll be able to see the stars brighter than ever before|}.
* [See the summit] -> summit

== summit ==
You reach the summit, the view is spectacular. {&You can see the sunrise|You can see the sun bathe rays across the world|You get to see the view as its brightest|You watch the sun set|The stars are shining brighter than ever before up here|}.
{ preference == "beaches": But the view from the pond was definitely a bit better after all.|}
{ preference == "mountains": This knocked the pond view out of the park easily.|}
-> END



== function time_progression ==

    ~ time = time + 1
    
    {
        - time > 4:
            ~ time = 0
    }