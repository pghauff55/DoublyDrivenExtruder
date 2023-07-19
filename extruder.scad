res=60;
r_608=11.5;
r_m8=4.25;
r_m4=2.25;
r_jhead=8.35;



//hingeplate();

drive_gear();
//gears();
//translate([0,-20,40])rotate([0,180,0])gears();
//main();
//translate([0,20,26])scale([0.97,0.97,1.0])gears2();

module drive_gear(){
//translate([-40,20,24])
mirror([0,0,1])import("extruder_drive_gear.stl");
}
module hingeplate(){
translate([15,0,-15])
difference(){
translate([0,-10,2])cube([5,20,26]);
translate([0,5,15]){
translate([0,0,-8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
translate([0,0,8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
}
translate([0,-5,15]){
translate([0,0,-8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
translate([0,0,8])rotate([0,90,0])cylinder(50,1.85,1.85,center=true,$fn=res);
}
}
}



module idler_mod(){ 
difference()
{
   
    translate([0,20,-25])rotate([0,-90,0])idler();
    translate([0,20,-10])cube([20,8,20],center=true);
    translate([0,-22,-10]){
        
        difference(){
        
        rotate([0,90,0])   cylinder(100,7,7,center=true,$fn=res);
        rotate([0,90,0])cylinder(101,6,6,center=true,$fn=res);
        
        translate([0,0,5])cube([101,14,10],center=true);
            }
    }
}
}


module gears2(){
//import gears
    difference(){
    union(){
    translate([0,0,1.5])cylinder(9,21,21,center=true,$fn=res);
translate([0,0,6])rotate([0,0,90])import("ParametricHerringboneGears-1.stl");
//import gears
        translate([0,0,-25])
    difference(){
translate([0,0,30])rotate([0,0,0])mirror([0,0,1])import("ParametricHerringboneGears.stl");
        cube([200,200,44],center=true);
    }
}
    cylinder(100,4.25,4.25,center=true,$fn=res);
    translate([0,0,4])cylinder(10,7.85,7.85,center=true,$fn=6);
    translate([0,0,10])cylinder(10,8.25,8.25,center=true,$fn=res);
}
}

module gears(){
//import gears
    difference(){
    union(){
    translate([0,0,12])cylinder(10,8.15,8.15,center=true,$fn=res);
translate([0,0,0])rotate([0,0,90])import("ParametricHerringboneGears-1.stl");
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



module main(){
difference(){
    union(){
translate([-2,-5,0])backing();
        
   body();     
    }
    translate([-60,-2,-20])cube([45,45,40]);
}
translate([0,20,0])rotate([0,0,180])translate([38,0,0])nema17mount();
}
// hobbed bolts
//translate([0,-20,30])cylinder(100,4,4,center=true,$fn=res);
//translate([0,20,30])cylinder(100,4,4,center=true,$fn=res);


//nema 17 mount
module nema17mount(){
dist_Nem17= 31.04/2;
dist_nema2=14;
h=8;
    
translate([0,-1,15]){
translate([-22.5,22,-29])cube([34.5,7,33]);
//cylinder(40,2.5,2.5,center=true,$fn=res);
difference(){
translate([-6.50,0])cube([2*dist_Nem17+dist_nema2-7.5,2*dist_Nem17+dist_nema2,h],center=true);
cylinder(h+1,14,14,center=true,$fn=res);
    rotate([0,0,0]){
translate([dist_Nem17,dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([-dist_Nem17,dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([dist_Nem17,-dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([-dist_Nem17,-dist_Nem17,0])cylinder(h+1,1.65,1.65,center=true,$fn=res);
translate([dist_Nem17,dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([-dist_Nem17,dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([dist_Nem17,-dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);
translate([-dist_Nem17,-dist_Nem17,4])cylinder(h/2+1,3.65,3.65,center=true,$fn=res);

    }
}
}
}
//m4 mount bolt
module bolts(){
    
translate([-40,12,0]){
translate([0,0,-12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([0,0,12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([9,0,-12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);
translate([9,0,12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);    
}
translate([-40,-12,0]){
translate([0,0,-12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([0,0,12])rotate([0,90,0])cylinder(20,r_m4,r_m4,center=true,$fn=res);
translate([9,0,-12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);
translate([9,0,12])rotate([0,90,0])cylinder(5,r_m4+2,r_m4+2,center=true,$fn=6);    

}

}


//backing
module backing(){
back_len=108;
back_h=38;
depth=48;
sides_thick=14;
difference(){
translate([0,-3,1]){
 translate([-9,-40,-1-back_h/2])   cube([20,17,back_h]);
translate([-depth,-back_len/2,-20])cube([7,back_len,back_h]);
//backing sides
translate([-depth,back_len/2-13.5,-20])cube([59,sides_thick,back_h]);
translate([-depth,-back_len/2,-20])cube([78,sides_thick,back_h]);
}
translate([2,0,0])filament();
//jhead head
translate([6,-56,0])rotate([90,0,0])cylinder(5,r_jhead,r_jhead,center=true,$fn=res);

//m4 bolts
translate([0,-20,0])bolts();
translate([4-23,-52,0])rotate([90,0,0])cylinder(40,2.25,2.25,center=true,$fn=res);
translate([4+23,-52,0])rotate([90,0,0])cylinder(40,2.25,2.25,center=true,$fn=res);
translate([4-23,-44,0])rotate([90,0,0])cylinder(5,4.25,4.25,center=true,$fn=6);
translate([4+23,-44,0])rotate([90,0,0])cylinder(5,4.25,4.25,center=true,$fn=6);

translate([-10,-20,0])bolts();
}
}






//import
module idler(){
translate([19,-40,0])rotate([0,-90,0])translate([-262,-75,-5])import("Idler.stl");
}
//filament
module filament(){
translate([4,0,0])rotate([90,0,0])cylinder(200,1.65,1.65,center=true,$fn=res);
}

//m3 screw
module m3_screw(){
translate([14,-18])cylinder(50,1.5,1.5,center=true,$fn=res);
}



//pinch body
module pinch_body(){
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

//hobbed bolt
cylinder(50,r_m8,r_m8,center=true,$fn=res);
//hobbed bolt clearance
cylinder(10,4.8,4.8,center=true,$fn=res);
//thrust bearing 608
translate([15,0,0])difference(){ 
cylinder(10,12.5,12.5,center=true,$fn=res);
cylinder(11,4,4,center=true,$fn=res);    
}
//bearings 608
translate([0,0,15])difference(){ 
cylinder(10,r_608,r_608,center=true,$fn=res);
cylinder(11,3.5,3.5,center=true,$fn=res);    
}
translate([0,0,-15])difference(){ 
cylinder(10,r_608,r_608,center=true,$fn=res);
cylinder(11,3.5,3.5,center=true,$fn=res);    
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
module body(){
apart=20;
//housing
   
translate([0,apart,0])mirror([0,1,0]){
pinch_body();
}


//housing
translate([0,-apart,0]){
pinch_body();
}




}



