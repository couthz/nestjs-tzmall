import { HttpException } from '@nestjs/common';
import {
  ErrorCodeMap,
  ErrorCodeMapType,
} from '../constants/error-code.constant';

/**
 * Api业务异常均抛出该异常
 */
export class ApiException extends HttpException {
  /**
   * 业务类型错误代码，非Http code
   */
  private errorCode: ErrorCodeMapType;

  constructor(message?: string, errorCode: ErrorCodeMapType = 10000) {
    super(ErrorCodeMap[errorCode], 200);
    this.errorCode = errorCode;
    this.message = message
  }

  getErrorCode(): ErrorCodeMapType {
    return this.errorCode;
  }
}
