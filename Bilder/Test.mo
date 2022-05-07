model Test
  Modelica.Blocks.Sources.Sine sine annotation(
    Placement(visible = true, transformation(origin = {-76, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-42, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {-12, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(visible = true, transformation(origin = {22, 14}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = 1)  annotation(
    Placement(visible = true, transformation(origin = {68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {32, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 1, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {32, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {56, 4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(sine.y, feedback.u1) annotation(
    Line(points = {{-64, 14}, {-50, 14}}, color = {0, 0, 127}));
  connect(feedback.y, integrator.u) annotation(
    Line(points = {{-32, 14}, {-24, 14}}, color = {0, 0, 127}));
  connect(signalVoltage.v, integrator.y) annotation(
    Line(points = {{10, 14}, {0, 14}}, color = {0, 0, 127}));
  connect(inductor.p, resistor.n) annotation(
    Line(points = {{58, 24}, {50, 24}}, color = {0, 0, 255}));
  connect(resistor.p, signalVoltage.p) annotation(
    Line(points = {{30, 24}, {22, 24}}, color = {0, 0, 255}));
  connect(signalVoltage.n, ground.p) annotation(
    Line(points = {{22, 4}, {32, 4}}, color = {0, 0, 255}));
  connect(firstOrder.u, integrator.y) annotation(
    Line(points = {{20, 50}, {4, 50}, {4, 14}, {0, 14}}, color = {0, 0, 127}));
  connect(ground.p, currentSensor.n) annotation(
    Line(points = {{32, 4}, {46, 4}}, color = {0, 0, 255}));
  connect(inductor.n, currentSensor.p) annotation(
    Line(points = {{78, 24}, {78, 4}, {66, 4}}, color = {0, 0, 255}));
  connect(currentSensor.i, feedback.u2) annotation(
    Line(points = {{56, -6}, {56, -12}, {-42, -12}, {-42, 6}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end Test;