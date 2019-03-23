function [] = debug_guidance_indi(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
plot(OB.TIME(m:n),OB.X_REF_LOCAL(m:n));
subplot(2,1,2)
plot(OB.TIME(m:n),OB.Y_REF_LOCAL(m:n));
end