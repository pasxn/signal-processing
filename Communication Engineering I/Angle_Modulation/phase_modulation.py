#!/usr/bin/env python3 

import numpy as np
from matplotlib import pyplot as plt 


t = np.linspace(0, 1, 1000)
    
# message signal
Am = 1
fm = 3
mt = Am*np.cos(2*np.pi*fm*t)

# mudulated signal
Ac = 1
fc = 40
kp = 1
xt = Ac*np.cos( 2*np.pi*fc*t + kp*mt )

# visualization
plt.subplot(2,1,1)
plt.title('mt')
plt.plot(mt, 'g')

plt.subplot(2,1,2)
plt.title('xt')
plt.plot(xt, 'r')

plt.show()