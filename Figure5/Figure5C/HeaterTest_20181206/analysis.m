%%

file_names = ["heat_10mm_1.mat", "heat_10mm_2.mat", "heat_10mm_3.mat"];

figure(1)
hold on


for dataset = 1:3
    
    load(file_names(dataset));

    max_temp = max(temp);

    subplot(2, 3, dataset)
    imagesc(coords(:,1)/1000, coords(:,2)/1000, temp_mat)
    daspect([1 1 1])
    xlabel('x [mm]');
    ylabel('y [mm]');
    colorbar()
    
    subplot(2, 3, dataset+3)
    qc = (temp_mat/max_temp) > 0.9;

    imagesc(coords(:,1)/1000, coords(:,2)/1000, qc)
    daspect([1 1 1])
    
    xlabel('x [mm]');
    ylabel('y [mm]');


    
end

hold off
