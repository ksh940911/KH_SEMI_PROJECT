package common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class YeogiyoFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File f) {
		File newFile = null;
		
		do {
			// 새 파일명 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
			DecimalFormat df = new DecimalFormat("000");
			
			// 확장자 구하기
			String oldName = f.getName();
			String ext = "";
			int dot = oldName.lastIndexOf(".");
			if(dot > -1) ext = oldName.substring(dot);
			
			String newName = sdf.format(new Date()) + df.format(Math.random() * 999) + ext;
			
			// 파일객체로 변환
			newFile = new File(f.getParent(), newName);
			
		}while(!createNewFile(newFile));

		return newFile;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}catch(IOException ignored) {
			return false;
		}
	}
}
