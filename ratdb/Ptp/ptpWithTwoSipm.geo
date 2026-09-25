// every thing in the simulation

{
name: "GEO",
index: "world",
valid_begin: [0.0, 0.0],
valid_end: [0.0, 0.0],
mother: "", // world volume has no mother
type: "box",
size: [700.0, 700.0, 700.0], // mm, half-length
material: "air",
invisible: 1,
}

// the box that we see(the liquide argon)

{
name: "GEO",
index: "inner_surface",
valid_begin: [0.0, 0.0],
valid_end: [0.0, 0.0],
mother: "world",
type: "box",
size: [600.0,600.0,600.0],
position: [0.0, 0.0, 0.0],
material: "LAr",
color:[0.42, 0.47, 0.57, 0.3] // blue
drawstyle: "solid"
}

// Daughter layer: Substrate (Acrylic) (6 mm thick → half-thickness = 3 mm)
// Positioned on the leftmost side of the layered structure.
// It extends from x = -12.5 to -6.5 mm (center at -9.5 mm).

{
  name: "GEO",
  index: "substrate",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 225.0, 247.5],
  position: [-9.5, 0.0, 0.0],
  //material: "acrylic_uvt_nakano",
  material: "Acrylic",
  color:[0.0, 1.0, 0.0, 0.1],
  drawstyle: "solid",
}

#generation_volume, where the photon are generated
{
  name: "GEO",
  index: "genVol",
  valid_begin: [0,0],
  valid_end: [0,0],
  mother: "inner_surface",
  type: "box",
  size: [0.001, 300.0, 300.0], // increasing thickness from 0.002 to 0.2mm for temporary testing
  position: [-12.701, 0.0, 0.0],
  material: "air",
  color:[0.3, 0.3, 0.1, 0.1] 
  drawstyle: "solid"
}


// Daughter layer: PTP (0.002 mm thick → half-thickness = 0.001 mm)
// Positioned on the leftmost side of the layered structure.
// It extends from x = -12.502 to -12.5 mm (center at -12.501 mm).
{
  name: "GEO",
  index: "PTP",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "substrate",
  type: "PTPCoating",
  box_length: 0.001,
  box_width: 225.0,
  box_thickness: 247.5,
  position: [-12.501, 0.0, 0.0],
  coating_material: "PTP",
  material: "PTP",
  finish: "polished",
  surfaceType: "dielectric_dielectric",
  sigma_alpha: 0.0,
  coating_color:[1.0, 0.0, 0.0, 0.3] // red
  drawstyle: "solid"
}

// Daughter layer: WLS (6 mm thick → half-thickness = 3 mm)
// Positioned such that it does not touch the PTP/Substrate layer, leaving a 2 mm gap (LAr will fill in this gap).
// Here, WLS is centered at x = -1.5 mm, so it extends from -4.5 to 1.5 mm.
{
  name: "GEO",
  index: "WLS",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 225.0, 247.5],
  position: [-1.5, 0.0, 0.0],
  material: "eljen_WLSP", // Pre-defined in ratpac-two
  //material: "EJ286", // Manually defined
  color:[0.0, 0.0, 1.0, 0.0]
  drawstyle: "solid"
}

// Daughter layer: Reflector (1 mm thick → half-thickness = 0.5 mm)
// Positioned on the far right, leaving no gap between WLS and Reflector.
// Its center is at x = 2.0 mm, so it extends from 1.5 to 2.5 mm.

 {
  name: "GEO",
  index: "reflector",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [0.5, 225.0, 247.5],
  position: [2.0, 0.0, 0.0],
  material: "glass",
  color:[1.0, 1.0, 1.0, 0.2] 
  coating_color:[1.0, 1.0, 1.0, 0.2]
  drawstyle: "solid"
 }

 {
  name: "GEO",
  index: "reflector_zpos",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 225.0, 0.5],
  position: [-1.5, 0.0, 248.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  coating_color:[1.0, 1.0, 1.0, 0.2]
  drawstyle: "solid"
 }

 {
   name: "GEO",
   index: "reflector_zneg",
   valid_begin: [0.0, 0.0],
   valid_end: [0.0, 0.0],
   mother: "inner_surface",
   type: "box",
   size: [3.0, 225.0 , 0.5],
   position: [-1.5, 0.0, -252],
   material: "glass",
   color: [1.0, 1.0, 1.0, 0.2] 
   coating_color:[1.0, 1.0, 1.0, 0.2]
   orientation: "manual",
  }

 {
  name: "GEO",
  index: "reflector_ypos",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 0.5, 247.0 ],
  position: [-1.5, 225.5, 0.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  coating_color:[1.0, 1.0, 1.0, 0.2]
  drawstyle: "solid"
 }

 {
  name: "GEO",
  index: "reflector_yneg",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 0.5, 247.0],
  position: [-1.5, -225.5, 0.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  coating_color:[1.0, 1.0, 1.0, 0.2]
  drawstyle: "solid"
 }


 ///////////
 /// SiPMs

 {
   name: "GEO",
   index: "sipm_side",
   valid_begin: [0.0, 0.0],
   valid_end: [0.0, 0.0],
   mother: "inner_surface",
   type: "pmtarray",
   pmt_model: "sipm",
   pmt_detector_type: "idpmt",
   sensitive_detector: "/mydet/pmt/inner",
   //efficiency_correction: 1.000,
   pos_table: "PMTINFO_sipm", //generated on the fly
   color: [0.8, 0.8, 0.8, 0.3] // light gray
   orientation: "manual",
 }



// ////////////////////////////////////////////////////////////////////////
// // Putting SiPMs and reflector at the first (right next to pTP) layer
 {
  name: "GEO",
  index: "sipm_side2",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "pmtarray",
  pmt_model: "sipm2",
  pmt_detector_type: "idpmt",
  sensitive_detector: "/mydet/pmt/inner",
  pos_table: "PMTINFO_sipm2", 
  color: [0.8, 0.8, 0.8, 0.3] 
  orientation: "manual",
 }

 {
  name: "GEO",
  index: "reflector2",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [0.5, 225.0, 247.5],
  position: [-6.0, 0.0, 0.0],
  material: "glass",
  color:[1.0, 1.0, 1.0, 0.2] 
  drawstyle: "solid"
 }
 {
  name: "GEO",
  index: "reflector2_zpos",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 225.0, 0.5],
  position: [-9.5, 0.0, 248.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  drawstyle: "solid"
 }

 {
  name: "GEO",
  index: "reflector2_zneg",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 225.0, 0.5],
  position: [-9.5, 0.0, -252.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  drawstyle: "solid"
 }

 {
  name: "GEO",
  index: "reflector2_ypos",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 0.5, 247.0 ],
  position: [-9.5, 225.5, 0.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  drawstyle: "solid"
 }
 {
  name: "GEO",
  index: "reflector2_yneg",
  valid_begin: [0.0, 0.0],
  valid_end: [0.0, 0.0],
  mother: "inner_surface",
  type: "box",
  size: [3.0, 0.5, 247.0],
  position: [-9.5, -225.5, 0.0],
  material: "glass",
  color: [1.0, 1.0, 1.0, 0.2],
  drawstyle: "solid"
 }
