
import { DtoValidation } from '@/modules/core/decorators';
import { ApiProperty } from '@nestjs/swagger';
import { PaginateDto } from './paginate.dto';

@DtoValidation({ type: 'query' })
export class RequestBodyAPIDTO<T> {
    
    page: PaginateDto;

    @ApiProperty()
    params: T;
}