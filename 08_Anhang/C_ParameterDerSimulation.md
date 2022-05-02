# Parameter der Simulation
## Maschinenparameter
### Asynchronmaschine

Table: Parameter für den Netzanschluss der Asynchronmaschine

| Parameter                         | Wert |
| --------------------------------- | ---- |
| `terminalBox1.terminalConnection` | "D"  |

Table: Parameter des Modells der Asynchronmaschine (`Fun­da­men­tal­Wave.­Basic­Ma­chines.­Asyn­chro­nous­In­duc­tion­Ma­chines.­AIM_­Squir­rel­Cage`)

| Parameter              | Wert                              |
| ---------------------- | --------------------------------- |
| `Jr`                   | `aimcData.Jr`                     |
| `Js`                   | `aimcData.Js`                     |
| `phiMechanical`        | `(displayUnit="rad")`             |
| `useSupport`           | `false`                           |
| `wMechanical`          | `(displayUnit=false)`             |
| `Lm`                   | `aimcData.Lm`                     |
| `Lrsigma`              | `aimcData.Lrsigma`                |
| `Lssigma`              | `(fixed=false)`                   |
| `Rr`                   | `aimcData.Rr`                     |
| `Rs`                   | `(fixed=true, start=aimcData.Rs)` |
| `effectiveStatorTurns` | `aimcData.effectiveStatorTurns`   |
| `fsNominal`            | `aimcData.fsNominal`              |
| `m`                    | `m`                               |
| `p`                    | `aimcData.p`                      |
| `TrOperational`        | 293,15, `displayUnit` = "K"       |
| `TrRef`                | 293,15, `displayUnit` = "K"       |
| `TsOperational`        | 293,15, `displayUnit` = "K"       |
| `TsRef`                | 293,15, `displayUnit` = "K"       |
| `alpha20r`             | 0, `displayUnit` = "K"            |
| `alpha20s`             | 0, `displayUnit` = "K"            |

Table: Werte des Parameterrecords (`Fre­quenz­um­for­mer.­Ma­schi­nen­pa­ra­me­ter.­AIM_­Squir­rel­Cage­Da­ta`) für die Asynchronmaschine

| Parameter              | Wert     |
| ---------------------- | -------- |
| `Jr`                   | 0        |
| `L0`                   | 0        |
| `Rr`                   | 0,120    |
| `Rs`                   | 0,083574 |
| `X0`                   | 14,83    |
| `X1`                   | 0,448208 |
| `X2`                   | 0,791    |
| `effectiveStatorTurns` | 9,171    |
| `p`                    | 1        |
| `fsNominal`            | 50       |

Table: Wicklungsdaten der Asynchronmaschine

| Parameter              | Symbol  | Wert          | Berechnung |
| ---------------------- | ------- | ------------- | ---------- |
| Windungszahl           | $?$     | 56            |            |
| Polpaarzahl            | $p$     | 1             |            |
| Nutzahl                | $?$     | 36            |            |
| Stränge                | $?$     | 3             |            |
| Lochzahl               | $?$     | 6             | $?$        |
| xi_z                   | $\xi_z$ | 0,16666666667 |            |
| xi_c                   | $\xi_c$ | 0,98260765    |            |
| Nuten je Polpaar       | $?$     | 18            |            |
| Wickelschritt          | $?$     | 10            |            |
| Spulenschritt          | $?$     | 28,6478898    |            |
| effektive Windungszahl | $?$     | 9,17100475    |            |

### Synchron-Generator

Table: Parameter für den Netzanschluss des Synchron-Generators

| Parameter                        | Wert |
| -------------------------------- | ---- |
| `terminalBox.terminalConnection` | "Y"  |

Table: Parameter aus der Auslegung des Synchro-Generators

| Parameter | Wert                                   |
| --------- | -------------------------------------- |
| $X_N$     | $\unit[0,44444444444444436]{\Omega}$   |
| $X_D$     | $\unit[0,37232409867781685]{\Omega}$   |
| $X_D'$    | $\unit[0,10727388372365276]{\Omega}$   |
| $X_D''$   | $\unit[0,063131689804932889]{\Omega}$  |
| $X_Q$     | $\unit[0,16268065808519006]{\Omega}$   |
| $X_Q''$   | $\unit[0,061911567284431417]{\Omega}$  |
| $X_0$     | $\unit[0,13773696682464454]{\Omega}$   |
| $X_S$     | $\unit[0,042106445136139446]{\Omega}$  |
| $f_{s,N}$ | $\unit[400]{\Omega}$                   |
| $R_s$     | $\unit[6,68E-03]{\Omega}$              |
| $T_{D0}'$ | $\unit[0,1075492579055312]{\Omega}$    |
| $T_D''$   | $\unit[0,0038358105876696909]{\Omega}$ |
| $T_Q''$   | $\unit[0,0028791616002136365]{\Omega}$ |

Table: Zwischenwerte und Berechnungsgleichungen für Parameter des Sychron-Generators

| Parameter      | Wert                               | Berechnung                                                                 |
| -------------- | ---------------------------------- | -------------------------------------------------------------------------- |
| $\omega_{s,N}$ | $\unit[2513,27412]{\frac{rad}{s}}$ | $2\pi f_{s,N}$                                                             |
| $x_d$          | 0,83772922                         | $\frac{X_D}{X_N}$                                                          |
| $x_d'$         | 0,24136624                         | $\frac{X_D'}{X_N}$                                                         |
| $x_d''$        | 0,1420463                          | $\frac{X_D''}{X_N}$                                                        |
| $x_q$          | 0,36603148                         | $\frac{X_Q}{X_N}$                                                          |
| $x_q''$        | 0,13930103                         | $\frac{X_Q''}{X_N}$                                                        |
| $x_s$          | 0,0947395                          | $\frac{X_S}{X_N}$                                                          |
| $x_{md}$       | 0,74298972                         | $x_d-x_s$                                                                  |
| $x_{mq}$       | 0,27129198                         | $x_q-x_s$                                                                  |
| $x_e$          | 0,92566732                         | $\frac{x_{md}^2}{x_d-x_d''}$                                               |
| $x_{rd}$       | 0,81282909                         | $\frac{x_{md}^2}{x_d'-x_d''}(1-\frac{x_{md}}{x_e})^2+\frac{x_{md}^2}{x_e}$ |
| $x_{rq}$       | 0,32461161                         | $\frac{x_{mq}^2}{x_q-x_q''}$                                               |
| $r_s$          | 0,0150285                          | $\frac{R_s}{X_N}$                                                          |
| $r_{rd}$       | 0,01321437                         | $\frac{x_{rd}-\frac{x_{md}^2}{x_e}}{\omega_{s,N}T_{D0}''}$                 |
| $r_{rq}$       | 0,01707238                         | $\frac{x_{rq}}{\omega_{s,N}T_{Q0}''}$                                      |
| $r_e$          | 0,00342458                         | $\frac{x_e}{\omega_{s,N}T_{D0'}}$                                          |
| $T_{d0}''$     | 0,00651784                         | $\frac{x_d'}{x_d''}T_D''$                                                  |
| $T_{Q0}''$     | 0,00756537                         | $\frac{x_q}{x_q''}T_Q$                                                     |
| turnsratio     | 47,9934193                         | $\frac{V_{s,Nominal}}{\omega_{s,N}L_{md}I_{e,OpenCircuit}}$                |

Table: Werte des Parameterrecords (`Machines.­Utilities.­Parameter­Records.­SM_­ElectricalExcited­Data`) für den Synchron-Generator

| Parameter              | Wert               |
| ---------------------- | ------------------ |
| `Jr`                   | 0                  |
| `IeOpenCircuit`        | 7,2563105523832900 |
| `Lmd`                  | 131,389E-6         |
| `Lmq`                  | 47,975E-6          |
| `Lrsigmad`             | 12,35031219E-6     |
| `Lrsigmaq`             | 9,428981013E-6     |
| `Lssigma`              | 16,7536222E-6      |
| `Re`                   | 6,8                |
| `Rrd`                  | 5,873051175E-3     |
| `Rrq`                  | 7,587723698E-3     |
| `Rs`                   | 0.006679333        |
| `VsNominal`            | 115                |
| `effectiveStatorTurns` | 14,958             |
| `fsNominal`            | 400                |
| `p`                    | 8                  |
| `sigmae`               | 0,1973             |
| `useDamperCage`        | `true`             |

Table: Parameter des Modells des Synchron-Generators

| Parameter              | Wert                                    |
| ---------------------- | --------------------------------------- |
| `Jr`                   | `smeeData.Jr`                           |
| `Js`                   | `smeeData.Js`                           |
| `phiMechanical`        | `(displayUnit="rad", fixed=false)`      |
| `useSupport `          | `false`                                 |
| `wMechanical`          | `(displayunit="rev/min", fixed=false)`  |
| `IeOpenCircuit`        | `smeeData.IeOpenCircuit`                |
| `Lmd`                  | `smeeData.Lmd`                          |
| `Lmq`                  | `smeeData.Lmq`                          |
| `Lrsigmad`             | `smeeData.Lrsigmad`                     |
| `Lrsigmaq`             | `smeeData.Lrsigmaq`                     |
| `Lssigma`              | `(fixed=false, start=smeeData.Lssigma)` |
| `Re`                   | `smeeData.Re`                           |
| `Rrd`                  | `smeeData.Rrd`                          |
| `Rrq`                  | `smeeData.Rrq`                          |
| `Rs`                   | `(fixed=false)`                         |
| `VsNominal`            | `smeeData.VsNominal`                    |
| `effectiveStatorTurns` | `smeeData.effectiveStatorTurns`         |
| `fsNominal`            | `smeeData.fsNominal`                    |
| `m`                    | `m`                                     |
| `p`                    | `smeeData.p`                            |
| `TeOperational`        | `293,15 (displayunit="K")`              |
| `TeRef`                | `293,15 (displayunit="K")`              |
| `TrOperational`        | `293,15 (displayunit="K")`              |
| `TrRef`                | `293,15 (displayunit="K")`              |
| `TsOperational`        | `293,15 (displayunit="K")`              |
| `TsRef`                | `293,15 (displayunit="K")`              |
| `alpha20e`             | 0                                       |
| `alpha20r`             | 0                                       |
| `alpha20s`             | 0                                       |

### Erregermaschine

Table: Parameter aus der Auslegung der Erregermaschine

| Parameter | Wert                       |
| --------- | -------------------------- |
| $X_N$     | $\unit[3,249]{\Omega}$     |
| $X_D$     | $\unit[28,75372]{\Omega}$  |
| $X_D'$    | $\unit[4,551998]{\Omega}$  |
| $X_D''$   | $\unit[4,17496]{\Omega}$   |
| $X_Q$     | $\unit[12,73185]{\Omega}$  |
| $X_Q''$   | $\unit[4,977648]{\Omega}$  |
| $X_0$     | $\unit[0,3364738]{\Omega}$ |
| $X_S$     | $\unit[2,438214]{\Omega}$  |
| $f_{s,N}$ | $\unit[148,5]{Hz}$         |
| $R_s$     | $\unit[0,2205]{\Omega}$    |
| $T_{D0}'$ | $\unit[0,04588457]{s}$     |
| $T_D''$   | $\unit[0,00087131]{s}$     |
| $T_Q''$   | $\unit[0,00105124]{s}$     |

Table: Zwischenwerte und Berechnungsgleichungen für Parameter der Erregermaschine

| Parameter      | Wert                               | Berechnung                                                                 |
| -------------- | ---------------------------------- | -------------------------------------------------------------------------- |
| $\omega_{s,N}$ | $\unit[933,053018]{\frac{rad}{s}}$ | $2\pi f_{s,N}$                                                             |
| $x_d$          | 8,85002155                         | $\frac{X_D}{X_N}$                                                          |
| $x_d'$         | 1,40104586                         | $\frac{X_D'}{X_N}$                                                         |
| $x_d''$        | 1,28499846                         | $\frac{X_D''}{X_N}$                                                        |
| $x_q$          | 3,91869806                         | $\frac{X_Q}{X_N}$                                                          |
| $x_q''$        | 1,5320554                          | $\frac{X_Q''}{X_N}$                                                        |
| $x_s$          | 0,7504506                          | $\frac{X_S}{X_N}$                                                          |
| $x_{md}$       | 8,09957094                         | $x_d-x_s$                                                                  |
| $x_{mq}$       | 3,16824746                         | $x_q-x_s$                                                                  |
| $x_e$          | 8,80698935                         | $\frac{x_{md}^2}{x_d-x_d''}$                                               |
| $x_{rd}$       | 11,0964007                         | $\frac{x_{md}^2}{x_d'-x_d''}(1-\frac{x_{md}}{x_e})^2+\frac{x_{md}^2}{x_e}$ |
| $x_{rq}$       | 4,20582107                         | $\frac{x_{mq}^2}{x_q-x_q''}$                                               |
| $r_s$          | 0,06786704                         | $\frac{R_s}{X_N}$                                                          |
| $r_{rd}$       | 4,11488605                         | $\frac{x_{rd}-\frac{x_{md}^2}{x_e}}{\omega_{s,N}T_{D0}''}$                 |
| $r_{rq}$       | 1,67638917                         | $\frac{x_{rq}}{\omega_{s,N}T_{Q0}''}$                                      |
| $r_e$          | 0,20570956                         | $\frac{x_e}{\omega_{s,N}T_{D0'}}$                                          |
| $T_{d0}''$     | 0,00095                            | $\frac{x_d'}{x_d''}T_D''$                                                  |
| $T_{Q0}''$     | 0,00268887                         | $\frac{x_q}{x_q''}T_Q$                                                     |
| turnsratio     | 1,49330662                         | $\frac{V_{s,Nominal}}{\omega_{s,N}L_{md}I_{e,OpenCircuit}}$                |

Table: Werte des Parameterrecords (`Machines.­Utilities.­Parameter­Records.­SM_­ElectricalExcited­Data`) für den Synchro-Generator der Erregermaschine

| Parameter              | Wert        |
| ---------------------- | ----------- |
| `Jr`                   | 0           |
| `IeOpenCircuit`        | 1,450488    |
| `Lmd`                  | 0,028203656 |
| `Lmq`                  | 0,011032209 |
| `Lrsigmad`             | 0,010435313 |
| `Lrsigmaq`             | 0,003612953 |
| `Lssigma`              | 0,002613157 |
| `Re`                   | 4,8         |
| `Rrd`                  | 13,36926478 |
| `Rrq`                  | 5,446588427 |
| `Rs`                   | 0.2205      |
| `VsNominal`            | 57          |
| `effectiveStatorTurns` | 93,528      |
| `fsNominal`            | 148,5       |
| `p`                    | 3           |
| `sigmae`               | 0,0803      |
| `useDamperCage`        | `false`     |
| `TeRef`                | 293,15      |
| `TrRef`                | 293,15      |
| `TsRef`                | 293,15      |
| `alpha20e`             | 0           |
| `alpha20r`             | 0           |
| `alpha20s`             | 0           | 

Table: Parameter des Synchro-Generators der Erregermaschine

| Parameter              | Wert                                    |
| ---------------------- | --------------------------------------- |
| `Jr`                   | `exciterData.Jr`                        |
| `Js`                   | `exciterData.Js`                        |
| `phiMechanical`        | `(displayUnit="deg")`                   |
| `useSupport `          | `false`                                 |
| `wMechanical`          | `(displayunit="rad/s")`                 |
| `IeOpenCircuit`        | `exciterData.IeOpenCircuit`             |
| `Lmd`                  | `exciterData.Lmd`                       |
| `Lmq`                  | `exciterData.Lmq`                       |
| `Lrsigmad`             | `exciterData.Lrsigmad`                  |
| `Lrsigmaq`             | `exciterData.Lrsigmaq`                  |
| `Lssigma`              | `(fixed=false, start=smeeData.Lssigma)` |
| `Re`                   | `exciterData.Re`                        |
| `Rrd`                  | `exciterData.Rrd`                       |
| `Rrq`                  | `exciterData.Rrq`                       |
| `Rs`                   | `(fixed=true, start=exciterData.Rs)`    |
| `VsNominal`            | `exciterData.VsNominal`                 |
| `effectiveStatorTurns` | `exciterData.effectiveStatorTurns`      |
| `fsNominal`            | `exciterData.fsNominal`                 |
| `m`                    | 3                                       |
| `p`                    | `exciterData.p`                         |
| `sigmae`               | `exciterData.sigmae`                    |
| `useDamperCage`        | `false`                                 |
| `TeOperational`        | `293,15 (displayunit="K")`              |
| `TeRef`                | `293,15 (displayunit="K")`              |
| `TrOperational`        | `293,15 (displayunit="K")`              |
| `TrRef`                | `293,15 (displayunit="K")`              |
| `TsOperational`        | `293,15 (displayunit="K")`              |
| `TsRef`                | `293,15 (displayunit="K")`              |
| `alpha20e`             | 0                                       |
| `alpha20r`             | 0                                       |
| `alpha20s`             | 0                                       |
| `useThermalPort`       | `false`                                 |

Table: Parameter des Gleichrichters der Erregermaschine

| Parameter    | Wert |
| ------------ | ---- |
| `GoffDiode`  | 1e-3 |
| `RonDiode`   | 1e-3 |
| `VkneeDiode` | 0,7  |
| `m`          | 3    |

## Reglerparameter

Table: Reglerparameter des Spannungsreglers

| Parameter       | Dezimalwert | Hexadezimalwert[^1] |
| --------------- | ----------- | ------------------- |
| `Ts`            | 0,00078125  | -                   |
| `UgenCtrlPP_G`  | 2048        | 0x800               |
| `UgenCtrlPP_D`  | 256         | 0x100               |
| `UgenCtrlPP_LL` | 6144        | 0x1800              |
| `UgenCtrlPP_UL` | 8192        | 0x2000              |
| `UgenCtrlP_D`   | 256         | 0x100               |
| `UgenCtrlP_LL`  | -32768      | 0x8000              |
| `UgenCtrlP_UL`  | 32767       | 0x7FFF              |
| `UgenCtrlI_G`   | 304         | 0x130               |
| `UgenCtrlI_D`   | 4096        | 0x1000              |
| `UgenCtrlI_LL`  | 0           | 0x0                 |
| `UgenCtrlI_UL`  | 32767       | 0x7FFF              |
| `UgenCtrlD_G`   | 27648       | 0x1000              |
| `UgenCtrlD_D`   | 256         | 0x5A00              |
| `UgenCtrlD_T`   | 2048        | 0x800               |
| `UgenCtrlD_LL`  | 32768       | 0x8000              |
| `UgenCtrlD_UL`  | 32767       | 0x7FFF              |
| `UgenCtrlLL`    | 0           | 0x0                 |
| `UgenCtrlUL`    | 14336       | 0x2000              | 

Table: Parameter für die Spannungsumwandlung, die Reglersteuerung und den Sollspannungsgeber

| Parameter              | Wert       |
| ---------------------- | ---------- |
| `offset_Map.I1`        | 0          |
| `offset_Map.I2`        | 32767      |
| `offset_Map.O2`        | 80         |
| `offset_Map1.O2`       | 3888 / 256 |
| `controlOn.startTime`  | 0,7        |
| `controlOn.startValue` | `false`    |
| `V_set.duration`       | 0,3        |
| `V_set.height`         | 115        |
| `V_set.startTime`      | 0,7        |

[^1]: 16 bit signed Integer

## Weitere

Table: Allgemeine Parameter, Parameter für die Netzspeisung und Parameter für die Last

| Parameter                     | Wert                                                        |
| ----------------------------- | ----------------------------------------------------------- |
| `simData.JRotor`              | 1,58                                                        |
| `simData.VNominal`            | 410                                                         |
| `simData.fNominal`            | 50                                                          |
| `ramp_net.height`             | `simData.VNominal * sqrt(2)`                                |
| `ramp_net.duration`           | 0,5                                                         |
| `fan.J`                       | `simData.JRotor`                                            |
| `fan.a`                       | `(fixed = false)`                                           |
| `fan.phi`                     | `(displayUnit = "rad")`                                     |
| `fan.w`                       | `(fixed = true, start = 314)`                               |
| `frequency.k`                 | 8 / (2 * pi)                                                |
| `loadTimeTable.extra­po­lation` | `Modelica.­Blocks.­Types.­Extra­po­lation.­HoldLastPoint` |
| `loadTimeTable.fileName`      | "Laststufen_timetable.txt"                                  |
| `loadTimeTable.smooth­ness`    | `Modelica.­Blocks.­Types.­Smooth­ness.­ConstantSegments`         |
| `loadTimeTable.table`         | [0, 0.705328, 0.00021048; 6.2, 0.352664, 0.00010524]        |
| `loadTimeTable.tableName`     | "laststufen"                                                |
| `loadTimeTable.table­OnFile`   | `false`                                                     |
