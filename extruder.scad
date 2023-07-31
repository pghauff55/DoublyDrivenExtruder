
include <MCAD-master/materials.scad>
include <MCAD-master/stepper.scad>
include <MCAD-master/bearing.scad>
include <MCAD-master/metric_fastners.scad>
include <MCAD-master/regular_shapes.scad>



res=80;
r_fila=1.41;
r_608=11.1;
r_m8=4.25;
r_m8_1=9.0;
r_m4=2.25;
r_jhead=8.35;

w_frs=8.5;
r_frs=12;
l_frs=43;
s_frs=0.3;
p_frs=0.25;
h_frs=30.0;
c_frs=5.0;
wd_frs=0.75;
n_frs=8;
apart_main=20;
r_main=14;

assembly(2,0,30);

//filament_feedrate_sensor(3,w_frs,r_frs,l_frs,s_frs,p_frs,h_frs,c_frs,wd_frs,n_frs,1);
main_body(apart_main,r_main);

//gears2();

//translate([-9,20,-5])scale([1,1,0.95])pulley_driver();



module pulley_driver(){
difference(){
import("extruder-drive-pulley.stl");
translate([0,0,-10])cylinder(100,4.25,4.25,center=true,$fn=res);
translate([0,0,11])cylinder(10,7.45,7.45,center=true,$fn=6);
translate([0,0,0])cylinder(10,7.45,7.45,center=true,$fn=6);
//flat_nut(8,5);

}
}

module assembly(x,xb,xc){
translate([0,-50,0])color("silver")import("Volcano Hotend Vyper.stl");


scale([0.8,1,0.8])color("red")filament();

translate([12*x+xb+xc,0,0]){color("blue")hingeplate();
color("silver"){
translate([5*x+xb,7,8])
rotate([0,90,0]){
     translate([0,0,15])spring3D(5,8,15);
     translate([0,0,33])mirror([0,0,1])bolt(3,50);
     }
     translate([5*x+xb,-7,8])
rotate([0,90,0]){
     translate([0,0,15])spring3D(5,8,15);
     translate([0,0,33])mirror([0,0,1])bolt(3,50);
     }
     translate([5*x+xb,7,-8])
rotate([0,90,0]){
     translate([0,0,15])spring3D(5,8,15);
     translate([0,0,33])mirror([0,0,1])bolt(3,50);
     }
     translate([5*x+xb,-7,-8])
rotate([0,90,0]){
     translate([0,0,15])spring3D(5,8,15);
     translate([0,0,33])mirror([0,0,1])bolt(3,50);
     }
}}
spring();
idlers(x,15,33,-15);
translate([0,0,0])filament_feedrate_sensor(0,w_frs,r_frs,l_frs,s_frs,p_frs,h_frs,c_frs,wd_frs,n_frs,1);
pressure_adjuster(x*1.35,-50,-15,20);
translate([-40,20,31]){

translate([-10,0,0])drive_gear();
}
translate([-10,0,0]){
z=1.5;za=-50;
translate([0,-20,40*z])rotate([0,180,0]){
translate([0,0,4*z+za])color("grey")bolt(8,65);
translate([0,0,22*z])bearing(model=608);
translate([0,0,52*z])bearing(model=608);
translate([0,0,36*z])pulley_driver();
translate([0,0,65*z])mirror([0,0,1])color("silver")flat_nut(8);
translate([0,0,za/2-30])mirror([0,0,0])import("extruder-gears-2.stl");
axis_line();
}


translate([0,20,26*z])rotate([0,180,0]){
translate([0,0,50*z])mirror([0,0,1])color("silver")flat_nut(8);
translate([0,0,7*z])bearing(model=608);
translate([0,0,37*z])bearing(model=608);
translate([0,0,23*z])pulley_driver();
translate([0,0,-10*z+za])color("grey")bolt(8,65);
translate([0,0,za/2-30])mirror([0,0,1])color("blue")import("extruder-gears-1.stl");
axis_line();

}
}
}











module axis_line(){

//axis lines
translate([0,0,100])color("red"){
translate([0,0,30])cylinder(30,0.2,0.2,center=true,$fn=res);
translate([0,0,0])cylinder(5,0.2,0.2,center=true,$fn=res);
translate([0,0,-30])cylinder(30,0.2,0.2,center=true,$fn=res);
}
translate([0,0,-100])color("red"){
translate([0,0,30])cylinder(30,0.2,0.2,center=true,$fn=res);
translate([0,0,0])cylinder(5,0.2,0.2,center=true,$fn=res);
translate([0,0,-30])cylinder(30,0.2,0.2,center=true,$fn=res);
}
translate([0,0,0])color("red"){
translate([0,0,30])cylinder(30,0.2,0.2,center=true,$fn=res);
translate([0,0,0])cylinder(5,0.2,0.2,center=true,$fn=res);
translate([0,0,-30])cylinder(30,0.2,0.2,center=true,$fn=res);
}

}















module spring(){


}


module idlers(x,xa,xc,xd){
translate([14,39,xd])color("silver")bolt(3,30);
translate([14,39,-xd])color("silver")flat_nut(3);
translate([1+xc,-3,0])
rotate([0,0,-(10+xa)*x]){
translate([25,-15.5,0])rotate([0,90,0]){
translate([-4,-6,-10])rotate([0,90,0]){
translate([0,0,4])cylinder(15,4,4,center=true,$fn=res);
bearing(model=608);
}
import("extruder-idler.stl");
}
}
translate([14,-39,-xd])color("silver")flat_nut(3);
translate([14,-39,xd])color("silver")bolt(3,30);
translate([1+xc,3,0])
rotate([0,0,(10+xa)*x]){
translate([25,15.5,0])mirror([0,1,0])rotate([0,90,0]){
translate([-4,-6,-10])rotate([0,90,0]){
translate([0,0,4])cylinder(15,4,4,center=true,$fn=res);
bearing(model=608);
}
import("extruder-idler.stl");
}
}

translate([-35,20+16.5,25])color("silver")mirror([0,0,1])bolt(3,10);
translate([-35,20-14.5,25])color("silver")mirror([0,0,1])bolt(3,10);


translate([-50,20,10])mirror([0,0,1])color("grey")motor(Nema17);
//hingeplate();
}



/**
* An edge (or line) between 2 nodes
*/
module line2(start, end, d, fn=4) {
  hull() {
    node2(start,d, fn);
    node2(end,d, fn);
  }      
}

///////////////////////////////////////////////////////////////////////////////


//                       FILAMENT FEED RATE SENSOR
//Proposed Rubber Wheels
//Ridged Channel Wheels raised diameter to 24mm per Wheel
//
////////////////////////////////////////////////////////////////////////////////

module filament_feedrate_sensor(show,w,r,l,s,p,h,c,wd,n,part){

// wheel1////////////////////////
if(show==0){
translate([r-4,0,0]){//wheel1
    translate([8,65,0]){
        color("silver")wheel1(w,r,s,p,c,wd,n);
        }
    }
}
else if(show==1){
translate([8,25,3.5]){
    wheel1(w,r,s,p,c,wd,n);
}
}////////////////////////////////////

//wheel2//////////////////////////////
if(show==0){
    translate([-(r-4),65,0]){//wheel2
    color("silver")
    wheel2(w,r,s,p,c,wd,n);
    }
}
else if(show==2){
    translate([-8,25,3]){//wheel2
        wheel2(w,r,s,p,c,wd,n);
    }
}/////////////////////////////////////

//nuts_bolts////////////////////////////////////////////////////////////////////
if(show==0){
    translate([r+5,65,0]){
        translate([-1,0,15])color("silver")mirror([0,0,1])bolt(3,25);
        translate([-1,0,-15])color("silver")flat_nut(3);
        translate([30,0,7.5])color("silver")rotate([0,90,0]){
        mirror([0,0,1])bolt(3,15);
        translate([0,0,-25.25])flat_nut(3);
        }
        translate([30,0,-7.5])color("silver")rotate([0,90,0]){
        mirror([0,0,1])bolt(3,15);
        translate([0,0,-25.25])flat_nut(3);
        }
    }
}
//potentiometer model///////////////////////////////////////////////////////
if(show==0){
translate([-(r-4),65,0]){
    translate([0,0,20])color("blue")cylinder(8,11,11,center=true,$fn=res);
    translate([0,0,12])color("grey")cylinder(10,4.25,4.25,center=true,$fn=res);
    translate([0,0,4])color("grey")cylinder(15,3.5,3.5,center=true,$fn=res);
    translate([-12,0,16])color("grey")cube([5,2,1]);
    translate([-12,-4,16])color("grey")cube([5,2,1]);
    translate([-12,4,16])color("grey")cube([5,2,1]);
}
}

//feed sensor body////////////////////////////////////////////////////////
if(show==0){
body_feed_sensor(l,h,part);
}
else if(show==3){
translate([0,0,-47.5])rotate([90,0,0])body_feed_sensor(l,h,part);
}

}
//////////////////////////////////////////////////////////////////////////////////////

////////////////////////// FEEDRATE SENSOR MODULES///////////////////////

////////////////////////////////////////////////////////////////////////////////////
module wheel1(w,r,s,p,c,wd,n){
difference(){
union(){
    cylinder(w,r,r,center=true,$fn=res);
     cylinder(c,r+p,r+p,center=true,$fn=res);
    cylinder(w+wd,3.75,3.75,center=true,$fn=res);
    
}
scale([1,1,1.8])torus(r+1.75,r+0.2);
for (i = [0:n:360]){
    rotate([0, 0, i])
    translate([r+p,0,0])scale([1,s,1])rotate([0,0,45])cube([2,2,c+0.1], center = true);
}
cylinder(11,1.75,1.75,center=true,$fn=res);
}
}
module wheel2(w,r,s,p,c,wd,n){
  difference(){
  union(){
     cylinder(w,r,r,center=true,$fn=res);
     cylinder(c,r+p,r+p,center=true,$fn=res);
     cylinder(w+wd,5.25,5.25,center=true,$fn=res);
    }
    scale([1,1,1.8])torus(r+1.75,r+0.2);
     for (i = [0:n:360]){
         rotate([0, 0, i])
         translate([r+p,0,0])scale([1,s,1])rotate([0,0,45])cube([2,2,c+0.1], center = true);
         }
     cylinder(11,3.15,3.15,center=true,$fn=res);
    }
}
////////////////////////////////////////////////////////////////////////////////////

//            MODULE           BODY FEEDRATE SENSOR
//
// Feed sensor body part1 and part2 separated by springs
//
////////////////////////////////////////////////////////////////////////////////////////
module body_feed_sensor(l,h,part){//////////////////////////////////////////
{



// body /////////////////////////////////////////////////

difference(){
translate([3,65,0])rotate([90,0,0])cylinder(h,2,2,center=true,$fn=res);
translate([-10,65,0])rotate([0,0,0])cylinder(8,14.5,14.5,center=true,$fn=res);
translate([15,65,0])rotate([0,0,0])cylinder(8,14.5,14.5,center=true,$fn=res);
translate([3.15,50,0])rotate([90,0,0])cylinder(100,1.25,1.25,center=true,$fn=res);
}
  
difference(){//body
translate([5,65,0]){


difference(){
union(){
        cube([l,h,22],center=true);
        translate([-5,-65,0])feet(part);
      
}
cube([l+1,h-10,10],center=true);
translate([5,0,0])cube([8,l+1,h+1],center=true);
translate([6,h/2-5,-8])rotate([0,90,0])cylinder(200,1.75,1.75,center=true,$fn=res);
translate([6,-h/2+5,8])rotate([0,90,0])cylinder(200,1.75,1.75,center=true,$fn=res);
translate([6,h/2-5,8])rotate([0,90,0])cylinder(200,1.75,1.75,center=true,$fn=res);
translate([6,-h/2+5,-8])rotate([0,90,0])cylinder(200,1.75,1.75,center=true,$fn=res);
translate([-20,h/2-5,-8])rotate([0,90,0])cylinder(5,3,3,center=true,$fn=6);
translate([-20,-h/2+5,8])rotate([0,90,0])cylinder(5,3,3,center=true,$fn=6);
translate([-20,h/2-5,8])rotate([0,90,0])cylinder(5,3,3,center=true,$fn=6);
translate([-20,-h/2+5,-8])rotate([0,90,0])cylinder(5,3,3,center=true,$fn=6);
}
}
if(part==1)translate([510,0,0])cube([1000,1000,1000],center=true);
else if(part==2)translate([-505,0,0])cube([1000,1000,1000],center=true);


//filament hole
translate([3.15,60,0])rotate([90,0,0])cylinder(150,1.25,1.25,center=true,$fn=res);

//axles ////////////////////////////////////////////////////////////////////////
translate([4,0,0]){//axles
translate([12,60,0]){
translate([-4,5,0])cylinder(50,1.75,1.75,center=true,$fn=res);
translate([2,5,0])cylinder(50,1.75,1.75,center=true,$fn=res);
translate([-1,5,0])cube([6,3.5,50],center=true);
translate([7,5,0])cube([3,5.95,50],center=true);
translate([6,5,-8])rotate([0,90,0])cylinder(14,1.5,1.5,center=true,$fn=res);
translate([6,5,8])rotate([0,90,0])cylinder(14,1.5,1.5,center=true,$fn=res);

}
translate([-14,65,10])cylinder(20,4.7,4.7,center=true,$fn=res);
translate([-14,65,10])cylinder(200,3.65,3.65,center=true,$fn=res);
}

}
}
}
////////////////////////////////////////////////////////////////////////////////////////////////
//                                    MODULE FEET 
////////////////////////////////////////////////////////////////////////////////////////////////
module feet(part){
if(part==1 || part==0){
translate([0,47.5,14]){
difference(){
union(){
rotate([90,0,0])cylinder(5,3.65,3.65,center=true,$fn=res);
translate([0,0,-3.65])cube([7.3,5,7],center=true);
}
rotate([90,0,0])cylinder(25,1.65,1.65,center=true,$fn=res);
}

}
translate([0,47.5,-14]){
difference(){
union(){
translate([0,0,3.65])cube([7.3,5,7],center=true);
rotate([90,0,0])cylinder(5,3.65,3.65,center=true,$fn=res);
}
rotate([90,0,0])cylinder(25,1.65,1.65,center=true,$fn=res);
}
}
}

}//// feed sensor end///////////////////////////////////////////////////////////////////////////











//////////////////////////////////////////////////////////////////////////////////////////////////


//                             PRESSURE ADJUSTER











///////////////////////////////////////////////////////////////////////////////////////////////////

module pressure_adjuster(x,xb,xc,xd){



translate([25*x+xb,0,0])rotate([0,90,0])color("grey")bolt(5,15);

//housing

//translate([30+20*x+xd,0,0])cube([5,30,38],center=true);
//translate([20,10,16])rotate([0,90,0])cylinder(15,1.65,1.65,center=true,$fn=res);
//translate([20,-10,16])rotate([0,90,0])cylinder(15,1.65,1.65,center=true,$fn=res);


translate([50+20*x+xd,0,0])difference(){
union(){
cube([5,40,38],center=true);
translate([-10,0,16.5])cube([25,26,5],center=true);
translate([-10,0,-16.5])cube([25,26,5],center=true);
}
translate([0,10,16.5])rotate([0,90,0])cylinder(200,1.65,1.65,center=true,$fn=res);
translate([0,-10,16.5])rotate([0,90,0])cylinder(200,1.65,1.65,center=true,$fn=res);
translate([0,10,-16.5])rotate([0,90,0])cylinder(200,1.65,1.65,center=true,$fn=res);
translate([0,-10,-16.5])rotate([0,90,0])cylinder(200,1.65,1.65,center=true,$fn=res);
rotate([0,90,0]){
cylinder(200,7,7,center=true,$fn=res);
translate([15.5,15.5,-30])bolt(3,100);
translate([-15.5,15.5,-30])bolt(3,100);
translate([15.5,-15.5,-30])bolt(3,100);
translate([-15.5,-15.5,-30])bolt(3,100);
}

}




//mirror([0,0,1])difference(){
//translate([18*x,0,0])cube([18,26,38],center=true);
//translate([20*x,0,-5])cube([30,31,38],center=true);
//}
translate([52*x,0,0])rotate([0,90,0]){
translate([15.5,15.5,-30])color("silver")bolt(3,15);
translate([-15.5,15.5,-30])color("silver")bolt(3,15);
translate([15.5,-15.5,-30])color("silver")bolt(3,15);
translate([-15.5,-15.5,-30])color("silver")bolt(3,15);
color("grey")motor(Nema17,NemaShort);
translate([0,0,-80])axis_line();
}



translate([34*x+xb+xc,0,0])rotate([0,90,0])color("silver")spring3D(7,8,15);
}


///////////////////////////////////////////////////////////////////////////////////////////////





//                                  MAIN BODY










///////////////////////////////////////////////////////////////////////////////////////////////

module main_body(apart,r){

difference(){
translate([18,0,0])cube([18,30,38],center=true);
translate([20,0,-5])cube([30,31,38],center=true);
translate([20,10,16.5]){
rotate([0,90,0])cylinder(35,1.65,1.65,center=true,$fn=res);
translate([0,0,1])cube([4,6,7],center=true);
}
translate([20,-10,16.5]){
rotate([0,90,0])cylinder(35,1.65,1.65,center=true,$fn=res);
translate([0,0,1])cube([4,6,7],center=true);
}
}

translate([0,0,-33])difference(){
translate([18,0,0])cube([18,30,38],center=true);
translate([20,0,-5])cube([30,31,38],center=true);
translate([20,10,16.5]){
    rotate([0,90,0])cylinder(35,1.65,1.65,center=true,$fn=res);
    translate([0,0,-1])cube([4,6,7],center=true);
    }
translate([20,-10,16.5]){
    rotate([0,90,0])cylinder(35,1.65,1.65,center=true,$fn=res);
    translate([0,0,-1])cube([4,6,7],center=true);
    }
}

difference(){
union(){
main(apart,r);



}
translate([-25,-10,0])cube([31,11,11],center=true);
//feed rate sensor mounting holes
translate([0,50,14]){
rotate([90,0,0])cylinder(42,1.65,1.65,center=true,$fn=res);
translate([0,-17,3])cube([6,4,15],center=true);
}
translate([0,50,-14]){
rotate([90,0,0])cylinder(42,1.65,1.65,center=true,$fn=res);
translate([0,-17,-3])cube([6,4,15],center=true);
}

translate([10,0,0])rotate([0,90,0])cylinder(5,2.65,2.65,center=true,$fn=res);
}
}







//////////////////////////////////////////////////////////////////////////////////////
//

//                              MAIN

//
////////////////////////////////////////////////////////////////////////////////////

module main(apart,r){
difference(){
    union(){
translate([-2,-5,0])backing(20);///////////////// module backing
        
   body(apart,r);     
    }
    translate([-60,-2,-20])cube([45,45,40]);
}
translate([-(r-4),20,0])rotate([0,0,180])translate([38,0,0])nema17mount();
}
// main end

//////////////////////////////////////////////////////////////////////////////////////////////

//                                MODULES


//////////////////////////////////////////////////////////////////////////////////////////////


//                   MODULE NEMA17 MOUNT


//////////////////////////////////////////////////////////////////////////////////////////////

//nema 17 mount
module nema17mount(){
dist_Nem17= 31.04/2;
dist_nema2=14;
h=8;
    
translate([-10,-1,15]){
translate([-23.5,22,-29])cube([35.5,7,33]);
//cylinder(40,2.5,2.5,center=true,$fn=res);
difference(){
translate([-6.5,0,0])cube([2*dist_Nem17+dist_nema2-10,2*dist_Nem17+dist_nema2,h],center=true);
translate([13,0,0])cylinder(h+1,14,14,center=true,$fn=res);
    translate([13,0,0])rotate([0,0,0]){
translate([dist_Nem17,dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([-dist_Nem17,dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([dist_Nem17,-dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([-dist_Nem17,-dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([dist_Nem17,dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([-dist_Nem17,dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([dist_Nem17,-dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([-dist_Nem17,-dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([-41,1,0])cylinder(100,r_608,r_608,center=true,$fn=res);
    }
}
}
}
//////////////////////////////////////////////////////////////////////////////////////////////


    //                   MODULE BOLTS                 


//////////////////////////////////////////////////////////////////////////////////////////////

module bolts(){
    
translate([-40,12,0]){
translate([0,0,-12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([0,0,12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([9,0,-12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);
translate([9,0,12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);    
}
translate([-40,-12,0]){
translate([0,0,-12])rotate([0,90,0]){

cylinder(20,r_m4,r_m4,center=true,$fn=res);

}
translate([0,0,12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([9,0,-12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);
translate([9,0,12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);    

}

}
//////////////////////////////////////////////////////////////////////////////////////////////

//                                  MODULE BACKING

//////////////////////////////////////////////////////////////////////////////////////////////
module backing(x){
back_len=108;
back_h=38;
depth=48;
sides_thick=14;

if(x!=20){
    translate([-(60+x),-(30),0]){
        translate([0,12,12])rotate([0,90,0])color("silver"){bolt(4,25);translate([0,0,40])flat_nut(4);}
        translate([0,-12,12])rotate([0,90,0])color("silver"){bolt(4,25);translate([0,0,40])flat_nut(4);}
        translate([0,12,-12])rotate([0,90,0])color("silver"){bolt(4,25);translate([0,0,40])flat_nut(4);}
        translate([0,-12,-12])rotate([0,90,0])color("silver"){bolt(4,25);translate([0,0,40])flat_nut(4);}
    }
}


difference(){
translate([0,-3,1]){
 translate([-9,-44,-1-back_h/2])   cube([20,17,back_h]);
translate([-depth-1,-back_len/2,-20])cube([7,back_len,back_h]);
//backing sides


difference(){
translate([-depth,back_len/2-13.5,-20])cube([59,sides_thick,back_h]);
translate([-6.2,39,-1])cube([16,11,11],center=true);
}
translate([-depth,-back_len/2,-20])cube([78,sides_thick,back_h]);
}
translate([2,0,0])filament();
//jhead head
translate([6,-56,0])rotate([90,0,0])cylinder(5,r_jhead,r_jhead,center=true,$fn=res);

//m4 bolts
translate([-10,-30,0])bolts();
translate([4-23,-52,0])rotate([90,0,0])cylinder(40,2.25,2.25,center=true,$fn=res);
translate([4+23,-52,0])rotate([90,0,0])cylinder(40,2.25,2.25,center=true,$fn=res);
translate([4-23,-44,0])rotate([90,0,0])cylinder(5,4.25,4.25,center=true,$fn=6);
translate([4+23,-44,0])rotate([90,0,0])cylinder(5,4.25,4.25,center=true,$fn=6);

//translate([-10,-20,0])bolts();
}
}


//////////////////////////////////////////////////////////////////////////////////////////////





//                                  MODULE PINCH BODY





//////////////////////////////////////////////////////////////////////////////////////////////


module pinch_body(r){
        //hinge
difference(){
    union(){
translate([14,-18,0])cylinder(10,5,5,center=true,$fn=res);
translate([8,-18,0])cube([10,10,10],center=true);
    }
    //m3 hinge
   //m3 screw
translate([14,-18])cylinder(50,1.75,1.75,center=true,$fn=res); 
//filament
translate([0,0,0])filament();
    
}

difference(){
 translate([-3,4,0])cube([25,38,38],center=true);  

translate([-(r-4),0,0]){
     //hobbed bolt
    cylinder(50,r_m8_1,r_m8_1,center=true,$fn=res);

    //hobbed bolt clearance
    cylinder(11,r+1.7,r+1.7,center=true,$fn=res);
    translate([-8,0,0])cube([20,2*(r+1.7)+1,11],center=true);
    //bearings 608
    translate([0,0,15])difference(){ 
        cylinder(10,r_608,r_608,center=true,$fn=res);
        cylinder(11,3.5,3.5,center=true,$fn=res);    
        }
    translate([0,0,-15])difference(){ 
        cylinder(10,r_608,r_608,center=true,$fn=res);
        cylinder(11,3.5,3.5,center=true,$fn=res);    
        }
}

//thrust bearing 608
translate([15,0,0])difference(){ 
cylinder(10,12.5,12.5,center=true,$fn=res);
cylinder(11,4,4,center=true,$fn=res);    
}

//filament
filament();
//m3 screw
translate([0,15,0]){
translate([0,0,-8])rotate([0,90,0])cylinder(50,1.65,1.65,center=true,$fn=res);
translate([0,0,8])rotate([0,90,0])cylinder(50,1.65,1.65,center=true,$fn=res);
}
translate([0,15,12])cube([3,5.65,20],center=true); 
translate([0,15,-12])cube([3,5.65,20],center=true); 
}
   
}

//////////////////////////////////////////////////////////////////////////////////////////////





//                                  MODULE PINCH BODY MIRRORED





//////////////////////////////////////////////////////////////////////////////////////////////

module body(apart,r){

//housing
   
translate([0,apart,0])mirror([0,1,0]){
pinch_body(r);
}


//housing
translate([0,-apart,0]){
pinch_body(r);
}




}

// END BODY




//////////////////////////////////////////////////////////////////////////////////////////////
//                                              SUBMODULES
//////////////////////////////////////////////////////////////////////////////////////////////


module drive_gear(){
//translate([-40,20,24])
mirror([0,0,1])import("extruder_drive_gear.stl");
}




module hingeplate(){
translate([15,0,-15])
difference(){
union(){
translate([-7,0,15])rotate([0,90,0])cylinder(20,5.5,5.5,center=true,$fn=res);
translate([0,-10,2])cube([5,20,26]);
}
translate([0,5,15]){
translate([0,0,-8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
translate([0,0,8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
}
translate([0,-5,15]){
translate([0,0,-8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
translate([0,0,8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
}

translate([-10,0,15])rotate([0,90,0])cylinder(50,2.65,2.65,center=true,$fn=res);
translate([-10,0,15])rotate([0,90,0])cylinder(20,4.85,4.85,center=true,$fn=6);


}

}



module idler_mod(){ 

difference()
{
   
    translate([0,20,-25])rotate([0,-90,0])idler();
    translate([0,20,-10])cube([20,8,20],center=true);
    translate([0,18,0])cylinder(20,8,8,center=true,$fn=res);
    translate([0,-22,-10]){
        
        difference(){
        
        rotate([0,90,0])   cylinder(100,7,7,center=true,$fn=res);
        rotate([0,90,0])cylinder(101,6,6,center=true,$fn=res);
        
        translate([0,0,5])cube([101,14,10],center=true);
            }
    }
}
}

/**
* A single node which is connected by edges
*/

module node2(pos, d, fn=4) {
  if (pos[0]!=undef && pos[1] != undef && pos[2] != undef){ 
    translate(pos) sphere(d=d, $fn = fn);    
  }
}

/**
* Basic logic for generating a 3d spring
*/ 

module spring2(d, dBottom=6, dTop=6, windings=2, height=10, steps=10, wireDiameter=1,fn=10) {
    // we use either d or dBottom&dTop
    r0 = d != undef ? d/2 : dBottom/2;
    r1 = d != undef ?d/2 : dTop/2;
    
    rx = (r0-r1) / (360.0*windings);    
    heightPerDegree = height/windings/360;
    
    for ( angle = [steps : steps : 360*windings] ){
        r = r0 - (angle * rx); 
        x0=r*cos(angle-steps);
        y0=r*sin(angle-steps);
        z0=(angle-steps)*heightPerDegree;
        x=r*cos(angle);
        y=r*sin(angle);
        z=angle*heightPerDegree;

        line2([x0,y0,z0],[x,y,z],d=wireDiameter,fn=fn);        
    }
}




/**
* 3D Spring with identical diameter at top and bottom. The top and boton might
* start with a flat circle
*/
module spring3D(d=5,windings=3,height=10,flatStart=true,flatEnd=true, wireDiameter=1,  fn=4) {  
    spring2(d=d, windings=windings,height=height, fn=fn);
    
    if (flatStart)
        spring2(dBottom=d,dTop=d,windings=1,height=0, fn=fn);
    if (flatEnd)
        translate([0,0,height]) spring2(dBottom=d,dTop=d, windings=1,height=0, fn=fn);

}
module gears2(){
//import gears
    difference(){
    union(){
    translate([0,0,1.75])cylinder(9.5,21,21,center=true,$fn=res);
translate([0,0,6])rotate([0,0,90])import("extruder-drive-pulley.stl");
//import gears
        translate([0,0,-25])
    difference(){
translate([0,0,30])rotate([0,0,0])mirror([0,0,1])import("ParametricHerringboneGears.stl");
        cube([200,200,44],center=true);
    }
}
    cylinder(100,4.25,4.25,center=true,$fn=res);
    translate([0,0,4])cylinder(10,7.85,7.85,center=true,$fn=6);
    translate([0,0,10])cylinder(12,8.25,8.25,center=true,$fn=res);
}
}

module gears(){
//import gears
    difference(){
    union(){
    translate([0,0,12])cylinder(10,8.15,8.15,center=true,$fn=res);
translate([0,0,0])rotate([0,0,90])import("extruder-drive-pulley.stl");
//import gears
   // difference(){
//translate([0,0,30])rotate([0,0,0])mirror([0,0,1])import("ParametricHerringboneGears.stl");
   //     cube([200,200,44],center=true);
   // }
}
   cylinder(100,4.25,4.25,center=true,$fn=res);
   translate([0,0,5])cylinder(10,7.5,7.5,center=true,$fn=6);
   translate([0,0,0])cylinder(10,8.25,8.25,center=true,$fn=res);
}
}
//import
module idler(){
translate([19,-40,0])rotate([0,-90,0])translate([-262,-75,-5])import("Idler.stl");
}
//filament
module filament(){
translate([4,0,0])rotate([90,0,0])cylinder(200,r_fila,r_fila,center=true,$fn=res);
}

//m3 screw
module m3_screw(){
translate([14,-18])cylinder(50,1.5,1.5,center=true,$fn=res);
}






