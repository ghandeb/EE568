' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 0) then 
  Set oDesign = oProject.GetDesign(oArgs(0))
else
  Set oDesign = oProject.GetActiveDesign()
end if
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+06)
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "70.113602517832746mm"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("M19_29G_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_29G_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", _
  0.15), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.36), Array(_
  "NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", _
  "X:=", 79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", _
  0.99), Array("NAME:Coordinate", "X:=", 318.3, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", _
  "X:=", 636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", _
  1.36), Array("NAME:Coordinate", "X:=", 1591.5, "Y:=", 1.44), Array(_
  "NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", _
  "X:=", 4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", _
  1.63), Array("NAME:Coordinate", "X:=", 7957.7, "Y:=", 1.67), Array(_
  "NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", _
  "X:=", 31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), _
  Array("NAME:Coordinate", "X:=", 190984, "Y:=", 2.1), Array(_
  "NAME:Coordinate", "X:=", 350138, "Y:=", 2.3), Array("NAME:Coordinate", _
  "X:=", 509292, "Y:=", 2.5), Array("NAME:Coordinate", "X:=", 2.10083e+06, _
  "Y:=", 4.5))), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", 164.2, _
  "core_loss_kc:=", 0.409, "core_loss_ke:=", 0, "conductivity:=", 1.96e+06, _
  "mass_density:=", 7650, Array("NAME:stacking_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Lamination"), "stacking_factor:=", "0.95", _
  Array("NAME:stacking_direction", "property_type:=", "ChoiceProperty", _
  "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("NdFe42_3DSF1.000_N")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe42_3DSF1.000_N", _
  "CoordinateSystemType:=", "Cylindrical", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1.05", "conductivity:=", "625000", _
  "mass_density:=", "7550", Array("NAME:magnetic_coercivity", _
  "property_type:=", "VectorProperty", "Magnitude:=", "-995000A_per_meter", _
  "DirComp1:=", "1", "DirComp2:=", "0", "DirComp3:=", "0"))
end if
if (oDefinitionManager.DoesMaterialExist("NdFe42_3DSF1.000_S")) then
else
oDefinitionManager.AddMaterial Array("NAME:NdFe42_3DSF1.000_S", _
  "CoordinateSystemType:=", "Cylindrical", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1.05", "conductivity:=", "625000", _
  "mass_density:=", "7550", Array("NAME:magnetic_coercivity", _
  "property_type:=", "VectorProperty", "Magnitude:=", "-995000A_per_meter", _
  "DirComp1:=", "-1", "DirComp2:=", "0", "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "58mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "30mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "M19_29G_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "58mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "100mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", _
  "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Stator", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_29G_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", _
  "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "StatorSlotInsu", "Flags:=", "", "Color:=", "(132 132 193)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "StatorSlotInsu:CreateUserDefinedPart:1", "LenRegion", _
  "100mm + 2*endRegion"
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "78deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "390"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "26.108642868392824ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.1634834958869521H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_0", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_1", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "15deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_2", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "60deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_3", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "75deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_4", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "120deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_5", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "135deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_6", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_6:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_6"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "180deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_7", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_7:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_7"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "195deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_8", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_8:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_8"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "240deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_9", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_9:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_9"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "255deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_10", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_10:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_10"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "300deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "160mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "24"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "34mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.07927766046676mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "13.03164749640968mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "CoilPitch", "Value:=", "6"), Array("NAME:Pair", _
  "Name:=", "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "SpanExt", "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "240.2272050356655mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_11", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_11:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_11"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "315deg")
On Error Resume Next
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Stator"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "57mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "30mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "4"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.8"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_29G_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "57mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "30mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "4"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.8"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "240.2272050356655mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "Mag", _
  "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "NdFe42_3DSF1.000_N", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "90deg", _
  "NumClones:=", "4"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe42_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "NdFe42_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion"), _
  Array("NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Shaft,Stator,Coil_0" & _
  ",Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7,Coil_8,Coil_9,Coil_10" & _
  ",Coil_11,Rotor,Mag_0,Mag_1,Mag_2,Mag_3", "Tool Parts:=", "Tool"), _
  Array("NAME:SubtractParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.2s", _
  "TimeStep:=", "0.0002s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.002ms" 
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
