//ai_grid_walk(x_where,y_where,speed,absolute)

if walking_path=0
    {if distance_to_point(argument0,argument1)>grid_size*3
        {walking_path=1;
        mp_grid_clear_all(mgrid);
        mp_grid_add_instances(mgrid,obj_solid_parent,1);
     
       mp_grid_path(mgrid,mpath,x,y,floor(argument0/grid_size)*grid_size+grid_size/2,
               floor(argument1/grid_size)*grid_size+grid_size/2,1);
        path_start(mpath,argument2,0,argument3); //argument3)
        path_update=0;
        }
    else
        {if distance_to_point(argument0,argument1)>grid_size/2
            {path_end();
            mp_potential_step_object(argument0,argument1,argument2,obj_solid_parent);
            }
        else
            {path_end();
            exit;
            }
        }
    }
