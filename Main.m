img = input("Enter the image file name: ",'s');
if isfile(img)
    mat = imread(img);
else
    disp("Given image doesn't exist");
    disp("Ending program...");
    return;
end
filename = input("Enter the name of the file: ", 's');
if isfile(filename)
    M = fileread(filename);
else
    disp("Given file doesn't exist");
    disp("Ending program...");
    return;
end

len=length(M);
[x,y,z] = size(mat);

if len*4 >= x*y*z
    disp("Smaller image to embed text file");
    disp("Ending program...");
end

disp("Embedding the file...");
embed_mat = Embed(mat,M); % Function call to Embed text file into the image

figure(1); image(embed_mat); % Image after Text Embedding

disp("Embedded image received, Extraction in process...");
extracted_str = Extract(embed_mat, len); % Text extracted from image & returned
disp("File contents extracted");
newfile = input("Enter the name to save the recieved file(with extension): ",'s');
fid = fopen(newfile,"w");
fwrite(fid,extracted_str);
fclose(fid);  
disp("File saved");


