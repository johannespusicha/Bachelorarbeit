# Parameter der Simulation
## Maschinenparameter
### Asynchronmaschine
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
Parameter des Modells der Asynchronmaschine (`FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage`)

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
Werte des Parameterrecords (`Frequenzumformer.Maschinenparameter.AIM_SquirrelCageData`) für die Asynchronmaschine

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
Wicklungsdaten der Asynchronmaschine

### Synchron-Generator
| Parameter | Wert                  |
| --------- | --------------------- |
| $X_N$     | 0,44444444444444436   |
| $X_D$     | 0,37232409867781685   |
| $X_D'$    | 0,10727388372365276   |
| $X_D''$   | 0,063131689804932889  |
| $X_Q$     | 0,16268065808519006   |
| $X_Q''$   | 0,061911567284431417  |
| $X_0$     | 0,13773696682464454   |
| $X_S$     | 0,042106445136139446  |
| $f_{s,N}$ | 400                   |
| $R_s$     | 6,68E-03              |
| $T_{D0}'$ | 0,1075492579055312    |
| $T_D''$   | 0,0038358105876696909 |
| $T_Q''$   | 0,0028791616002136365 |
Parameter aus der Auslegung des Synchro-Generators

| Parameter      | Wert       | Berechnung                                                                 |
| -------------- | ---------- | -------------------------------------------------------------------------- |
| $\omega_{s,N}$ | 2513,27412 | $2\pi f_{s,N}$                                                             |
| $x_d$          | 0,83772922 | $\frac{X_D}{X_N}$                                                          |
| $x_d'$         | 0,24136624 | $\frac{X_D'}{X_N}$                                                         |
| $x_d''$        | 0,1420463  | $\frac{X_D''}{X_N}$                                                        |
| $x_q$          | 0,36603148 | $\frac{X_Q}{X_N}$                                                          |
| $x_q''$        | 0,13930103 | $\frac{X_Q''}{X_N}$                                                        |
| $x_s$          | 0,0947395  | $\frac{X_S}{X_N}$                                                          |
| $x_{md}$       | 0,74298972 | $x_d-x_s$                                                                  |
| $x_{mq}$       | 0,27129198 | $x_q-x_s$                                                                  |
| $x_e$          | 0,92566732 | $\frac{x_{md}^2}{x_d-x_d''}$                                               |
| $x_{rd}$       | 0,81282909 | $\frac{x_{md}^2}{x_d'-x_d''}(1-\frac{x_{md}}{x_e})^2+\frac{x_{md}^2}{x_e}$ |
| $x_{rq}$       | 0,32461161 | $\frac{x_{mq}^2}{x_q-x_q''}$                                               |
| $r_s$          | 0,0150285  | $\frac{R_s}{X_N}$                                                          |
| $r_{rd}$       | 0,01321437 | $\frac{x_{rd}-\frac{x_{md}^2}{x_e}}{\omega_{s,N}T_{D0}''}$                 |
| $r_{rq}$       | 0,01707238 | $\frac{x_{rq}}{\omega_{s,N}T_{Q0}''}$                                      |
| $r_e$          | 0,00342458 | $\frac{x_e}{\omega_{s,N}T_{D0'}}$                                          |
| $T_{d0}''$     | 0,00651784 | $\frac{x_d'}{x_d''}T_D''$                                                  |
| $T_{Q0}''$     | 0,00756537 | $\frac{x_q}{x_q''}T_Q$                                                     |
| turnsratio     | 47,9934193 | $\frac{V_{s,Nominal}}{\omega_{s,N}L_{md}I_{e,OpenCircuit}}$                |
Zwischenwerte und Berechnungsgleichungen für Parameter des Sychron-Generators

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
Werte des Parameterrecords (`Machines.Utilities.ParameterRecords.SM_ElectricalExcitedData`) für den Synchron-Generator 

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
Parameter des Modells des Synchron-Generators

### Erregermaschine
