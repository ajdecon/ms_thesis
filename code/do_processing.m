function result = do_processing(img,radius,height)

    BW=im2bw(img(:,:,f),graythresh(img(:,:,f)));
    E=imopen(BW,strel('disk',2));
    D=imhmin(-bwdist(~E),1);
    W=watershed(D);
    W(E==0)=0;
    
    result = W;
