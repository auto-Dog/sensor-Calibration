# sensor-Calibration
sensor Calibration by using GA

运行maincode，将会从csv训练集中读取T-V数据，并根据特定取T点策略拟合出T-V曲线，与原T-V曲线比较误差后得出成本。**目的是得到最优取T点方案**


取点策略由遗传算法迭代产生，目前最优解成本值357（训练集）
