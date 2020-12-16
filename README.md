# computer-version-lab
#### 计算机视觉

##### Lab1:

Q1:We wish to set all pixels that have a brightness of 10 or less to 0, to remove sensor noise. However, our code is slow when run on a database with 1000 grayscale images.

Q1.1: How could we speed it up?

Q1.2: What factor speedup would we receive over 1000 images? Please measure it. (Ignore fifile loading; assume all images are equal resolution; don’t assume that the time taken for one image ×1000 will equal 1000 image computations, as single short tasks on multitasking computers often take variable time. )

Q1.3: How might a speeded-up version change for color images? Please measure it. Image: grizzlypeak.jpg

Q2.1:What is incorrect with this approach? How can it be fifixed while maintaining the same amount of brightness reduction?

Q2.2: Where did the original corruption come from? Which specifific values in the original image did it represent? 

##### Lab2:

step1:RGB转Gray：rgb->gray 

step2:直方图处理:hist

step3: 补偿函数处理:clipping

step4:处理灰度概率,积累函数处理:pdf，cdf

step5:累积像素转换为新的灰度级，查看新图的直方图：看一看结果的直方图

step6:显示新图：映射一个直方图均衡化后的灰度图

step7:将新图转化为彩色图：还原彩色图

##### Lab3:

对比全局均衡化和局部均衡化的效果

##### Lab4:

图像融合：高斯金字塔、拉普拉斯金字塔

##### Lab5:

角点检测：Harris角点检测算法