package com.minhyuk.common.activity;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.minhyuk.common.util.MediaUtil;
import com.minhyuk.common.util.UploadUtil;


@Controller
@RequestMapping("/images/*")
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	@ResponseBody
	@RequestMapping(value = "/member", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> imageUpload(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());

		return new ResponseEntity<>(UploadUtil.UploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayImage(String imageName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("image name : " + imageName);

		try {
			String formatName = imageName.substring(imageName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtil.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + imageName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				imageName = imageName.substring(imageName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; imagename=\""
						+ new String (imageName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			//in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteImage (String imageName) {
		logger.info("delete file : " + imageName);

		new File(uploadPath + imageName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
