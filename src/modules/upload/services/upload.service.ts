import { MultipartFile } from '@fastify/multipart';
import { Injectable, NotFoundException } from '@nestjs/common';
import { isNil } from 'lodash';
import {
  fileRename,
  getFilePath,
  saveLocalFile,
} from '@/utils/file.util';

@Injectable()
export class UploadService {
  /**
   * 保存文件上传记录
   */
  async saveFile(file: MultipartFile): Promise<string> {
    if (isNil(file)) throw new NotFoundException('Have not any file to upload!');

    const fileName = file.filename;
    // const size = getSize(file.file.bytesRead);
    // const extName = getExtname(fileName);
    // const type = getFileType(extName);
    const name = fileRename(fileName);
    const path = getFilePath(name);

    saveLocalFile(await file.toBuffer(), name);

    return path;
  }
}
