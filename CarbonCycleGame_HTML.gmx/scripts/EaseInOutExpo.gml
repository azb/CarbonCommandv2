/*
    EaseInOutExpo(time, start, change, duration)
*/

argument0 /= argument3 * 0.5;

if (argument0 < 1) 
    return argument2 * 0.5 * power(2, 10 * (argument0 - 1)) + argument1;

argument0 -= 1;
return argument2 * 0.5 * (-power(2, -10 * argument0) + 2) + argument1;