import { BadRequestException, Body, Controller, Post } from '@nestjs/common';
import { ApiConsumes, ApiTags } from '@nestjs/swagger';


import { FileUploadDto } from '../dtos/upload.dto';

import { UploadService } from '../services/upload.service';
import { UploadModule } from '../upload.module';
import { Depends } from '@/modules/restful/decorators';

@ApiTags('上传管理')
@Depends(UploadModule)
@Controller('upload')
export class UploadController {
  constructor(private uploadService: UploadService) {}

  @Post('file')
  @ApiConsumes('multipart/form-data')
  async upload(@Body() dto: FileUploadDto) {
    const { file } = dto;

    try {
      const path = await this.uploadService.saveFile(file);

      return {
        filename: path,
      };
    } catch (error) {
      console.log(error);
      throw new BadRequestException('上传失败');
    }
  }
}
