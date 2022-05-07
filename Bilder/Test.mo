model Test
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(visible = true, transformation(origin = {22, 14}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = 1)  annotation(
    Placement(visible = true, transformation(origin = {68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {32, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 1, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {56, 4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-108, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(visible = true, transformation(origin = {-70, 14}, extent = {{-20, -12}, {20, 12}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {-8, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-34, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints1 annotation(
    Placement(visible = true, transformation(origin = {-8, -18}, extent = {{20, -12}, {-20, 12}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 1, k = 1) annotation(
    Placement(visible = true, transformation(origin = {-8, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.VariableResistor resistor annotation(
    Placement(visible = true, transformation(origin = {40, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = -.9, offset = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, 56}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(signalVoltage.n, ground.p) annotation(
    Line(points = {{22, 4}, {32, 4}}, color = {0, 0, 255}));
  connect(ground.p, currentSensor.n) annotation(
    Line(points = {{32, 4}, {46, 4}}, color = {0, 0, 255}));
  connect(inductor.n, currentSensor.p) annotation(
    Line(points = {{78, 24}, {78, 4}, {66, 4}}, color = {0, 0, 255}));
  connect(inverseBlockConstraints.y2, firstOrder.u) annotation(
    Line(points = {{-53, 14}, {-58, 14}}, color = {0, 0, 127}));
  connect(firstOrder.y, inverseBlockConstraints.u2) annotation(
    Line(points = {{-81, 14}, {-87, 14}}, color = {0, 0, 127}));
  connect(integrator.y, signalVoltage.v) annotation(
    Line(points = {{4, 14}, {10, 14}}, color = {0, 0, 127}));
  connect(currentSensor.i, inverseBlockConstraints1.u1) annotation(
    Line(points = {{56, -6}, {56, -18}, {14, -18}}, color = {0, 0, 127}));
  connect(firstOrder1.y, inverseBlockConstraints1.u2) annotation(
    Line(points = {{4, -18}, {8, -18}}, color = {0, 0, 127}));
  connect(firstOrder1.u, inverseBlockConstraints1.y2) annotation(
    Line(points = {{-20, -18}, {-24, -18}}, color = {0, 0, 127}));
  connect(integrator.u, feedback.y) annotation(
    Line(points = {{-20, 14}, {-25, 14}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints1.y1, feedback.u2) annotation(
    Line(points = {{-28, -18}, {-34, -18}, {-34, 6}}, color = {0, 0, 127}));
  connect(feedback.u1, inverseBlockConstraints.y1) annotation(
    Line(points = {{-42, 14}, {-48, 14}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.u1, sine.y) annotation(
    Line(points = {{-92, 14}, {-96, 14}}, color = {0, 0, 127}));
  connect(resistor.p, signalVoltage.p) annotation(
    Line(points = {{30, 24}, {22, 24}}, color = {0, 0, 255}));
  connect(resistor.n, inductor.p) annotation(
    Line(points = {{50, 24}, {58, 24}}, color = {0, 0, 255}));
  connect(ramp.y, resistor.R) annotation(
    Line(points = {{50, 56}, {40, 56}, {40, 36}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-80, 40}, {80, -20}})),
    version = "");
end Test;