# DoublyDrivenExtruder
Two bolts drive the drive_pulleys that drives the filament into the hotend . Driven by a gear set and belt and one nema17motor.

Pressure Adjuster

Feedrate Sensor

Marlin Firmware and Closed Loop Stepper Motor
https://reprap.org/forum/read.php?415,855273
```
// Employ an external closed loop controller. Override pins here if needed.
//#define EXTERNAL_CLOSED_LOOP_CONTROLLER
#if ENABLED(EXTERNAL_CLOSED_LOOP_CONTROLLER)
  //#define CLOSED_LOOP_ENABLE_PIN        -1
  //#define CLOSED_LOOP_MOVE_COMPLETE_PIN -1
#endif
```
Extruder(E0) Enable Pin
External Pin to signal move complete

<div align="center">
    <img src="extruder.png" width="1200px"</img> 
</div>
<div align="center">
    <img src="extruder2.png" width="1200px"</img> 
</div>
