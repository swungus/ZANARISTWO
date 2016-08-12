//This script was developed by VP Studios. Place it in the Step Event of the ai object.

//vp_tds_ai(initialize,opponent,cover,dodge_this,ammunition,difficulty,max_speed,grid_size,ally,reload_time)
/*
    initialize      | true if first time running (make a variable)
    opponent        | the target object
    cover           | the cover object
    dodge_this      | the bullet object to dodge
    ammunition      | what to shoot
    difficulty      | difficulty level (0=impossibly stupid, 100=genius)
    max_speed       | maximum walking speed
    grid_size       | the size of the squares that the AI will be walking around on
                            (best set to the rounded-up square size of the characters)
    ally            | the ally object (usually the object it is)
                            (this allows cooperation among team members)
    reload_time     | how often the AI can shoot (default 15)
*/
if argument0=1
    {//basically a create event, but contained in this script
    grid_size=argument7;
    intelligence=abs(min(argument5,100));
    walk_speed=argument6*(2/4);
    retreat_speed=argument6*(3/4);
    dodge_speed=argument6*(4/4);
    retreat=0;
    retreat_timer=0;
    max_retreat_timer=120;
    casual_distance=50+intelligence*2;
    dodge_distance=intelligence;
    grid_size=argument7;
    //initialize the movement grid
    mgrid=mp_grid_create(-grid_size,-grid_size,room_width/grid_size+2,
        room_height/grid_size+2,grid_size,grid_size);
    mpath=path_add();
    walking_path=0;
    path_update=0;
    path_update_speed=20;
    alerted=0;
    strategy_index=min(round(random(intelligence/10)+1),instance_number(argument2));
    strategy_change=intelligence;
    strategize=strategy_change;
    can_shoot=1;
    reload_time=argument9;
    reload_index=0;
    ddirection=0;
    if random(100)>=(100-intelligence) then is_smart=1;
    else is_smart=0;
    pn=choose(1,-1); //positive or negative (random)
    hit_indicator=hp;
    rush_ready=1;
    rush=0;
    support_ally=0;
    }
nearest_ally=instance_nearest(x,y,argument8);
if support_ally=1
    {target=nearest_ally.target;
    }
else
    {target=instance_nearest(x,y,argument1);
    }
if !instance_exists(target) or distance_to_object(target)>400  //follow range
    {support_ally=0;
    exit;
    }

    
    
cover=instance_nearest(x,y,argument2);
cover_type=argument2;
retreat_timer+=1;
path_update+=1;
strategize+=1;
dodge_this=instance_nearest(x,y,argument3);
if retreat_timer>=max_retreat_timer
    {retreat_timer=0;
    retreat=0;
    //also use this timer for other strategical factors
    rush=0;
    rush_ready=1;
    if random(100)>=(100-intelligence) then is_smart=1;
    else is_smart=0;
    pn=choose(1,-1);
    support_ally=0;
    }
if path_update>=path_update_speed
    {path_update=0;
    walking_path=0;
    }
if can_shoot=0
    {reload_index+=1;
    if reload_index>=reload_time
        {reload_index=0;
        can_shoot=1;
        }
    }
ddirection_last=ddirection
//find the best cover
if strategize>=strategy_change
    {i=grid_size;
    strategic_cover=instance_nth_nearest(target.x,target.y,argument2,strategy_index);
    strategy_index=min(round(random(intelligence/10)+1),instance_number(argument2));
    strategize=0
    do
        {strategic_direction=point_direction(target.x,target.y,x,y)-(100-intelligence)+random(2*(100-intelligence));
        strategic_x=strategic_cover.x+(grid_size/2)+lengthdir_x(i,strategic_direction);
        strategic_y=strategic_cover.y+(grid_size/2)+lengthdir_y(i,strategic_direction);
        i+=1;
        }
    until (collision_circle(strategic_x,strategic_y,grid_size/4,cover_type,0,0)<=0)
    do
        {strategic_direction=point_direction(target.x,target.y,x,y)-(100-intelligence)+random(2*(100-intelligence));
        normal_cover_x=cover.x+(grid_size/2)+lengthdir_x(i,strategic_direction);
        normal_cover_y=cover.y+(grid_size/2)+lengthdir_y(i,strategic_direction);
        i+=1;
        }
    until (collision_circle(normal_cover_x,normal_cover_y,grid_size/4,cover_type,0,0)<=0)
    }
    
//shooting
ddirection=point_direction(x,y,target.x,target.y);
if collision_line(x,y,target.x,target.y,cover_type,0,0)<=0  and distance_to_object(target)<130
    {if can_shoot=1 && collision_line(x,y,target.x,target.y,argument8,0,1)<=0 and distance_to_object(target)<130
        {z=instance_create(x+lengthdir_x(20,ddirection),
            y+lengthdir_y(20,ddirection),argument4)
        z.direction=ddirection-(50-intelligence/2)+random(2*(50-intelligence/2));
        can_shoot=0;
        }
    }
    
//dodging projectiles
if distance_to_object(dodge_this)<=dodge_distance
    {if is_smart=1
        {if collision_line(x,y,dodge_this.x,dodge_this.y,cover_type,0,0)<=0
            {//dodge the projectile if there isn't an obstacle in the way and are smart enough
            if random(100)>intelligence*2 then exit;
            path_end();
            mp_potential_step_object(dodge_this.x,dodge_this.y,-dodge_speed,cover_type);
            exit; //and don't double-move
            }
        }
    else
        {//dodge the projectile no matter where it is
        if random(100)>intelligence*2 then exit;
        path_end();
        mp_potential_step_object(dodge_this.x,dodge_this.y,-dodge_speed,cover_type);
        exit; //and don't double-move
        }
    }
    
//if just hit, then retreat (if smart enough)
if hit_indicator!=hp
    {hit_indicator=hp
    if is_smart=1
        {retreat=1;
        rush=0;
        retreat_timer=0;
        }
    }
    
//if nearest ally needs help, then support them (if smart enough)
if nearest_ally.retreat=1
    {if intelligence>=30
        {support_ally=1;
        retreat_timer=0;
        }
    }
else
    {if is_smart=1
        {if nearest_ally.hit_indicator!=nearest_ally.hp
            {support_ally=1;
            retreat_timer=0;
            }
        }
    }

if rush=0
    {//normal movement
    if collision_line(x,y,target.x,target.y,argument2,0,0)>0 or distance_to_object(target)>130
        {if retreat=0
            {if distance_to_object(target)>casual_distance
                {
                vp_tds_ai_grid_walk(target.x,target.y,retreat_speed,0);
                }
            else
                {
                vp_tds_ai_grid_walk(strategic_x,strategic_y,walk_speed,0);
                if rush_ready=1 //if ready to rush, then rush opponent
                    {rush_ready=0;
                    if random(100)>=(100-intelligence)
                        {rush=1;
                        retreat_timer=0;
                        }
                    }
                }
            }
        else
            {
            vp_tds_ai_grid_walk(strategic_x,strategic_y,retreat_speed,0);
            }
        ddirection=direction
        }
    else
        {if retreat=0
            {
            if is_smart=1
                {vp_tds_ai_grid_walk(normal_cover_x,normal_cover_y,walk_speed,0);
                }
            else
                {
                }
            }
        else
            {
            vp_tds_ai_grid_walk(normal_cover_x,normal_cover_y,retreat_speed,0);
            }
        }
    }
else
    {
    vp_tds_ai_grid_walk(target.x,target.y,dodge_speed,0);
    }
image_angle=  lerp(ddirection_last, ddirection,0.1)

