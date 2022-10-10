package com.minhyuk.common.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadUtil {
	private static final Logger logger = LoggerFactory.getLogger(UploadUtil.class);
	
	public static String UploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		UUID uid = UUID.randomUUID();
		
		String imageName = uid.toString() + "_" + originalName;
		String imagePath = calcPath(uploadPath);
		
		File target = new File(uploadPath + imagePath, imageName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		
		String uploadName = null;
		
		if (MediaUtil.getMediaType(formatName) != null) {
			uploadName = makeIcon(uploadPath, imagePath, imageName);
		}
		
		return uploadName;
	}
	
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		
		if (new File(uploadPath + paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	/*// 썸네일 생성
	private static String makeThumbnail(String uploadPath, String path, String name) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, name));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + name;
		
		File newFile = new File(thumbnailName);
		String formatName = name.substring(name.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}*/
	
	private static String makeIcon(String uploadPath, String path, String imageName) throws Exception {
		String iconName = uploadPath + path + File.separator + imageName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
