import { Transform } from 'class-transformer';

import { IsNumber, IsOptional, Min } from 'class-validator';
import { toNumber } from 'lodash';

import { DtoValidation } from '@/modules/core/decorators';
import { PaginateOptions } from '@/modules/database/types';

@DtoValidation({ type: 'query' })
export class PaginateDto implements PaginateOptions {
    /**
     * 当前页
     */
    @Transform(({ value }) => toNumber(value))
    @Min(1, { message: '当前页必须大于1' })
    @IsNumber()
    @IsOptional()
    current?: number = 1;

    /**
     * 每页数据量
     */
    @Transform(({ value }) => toNumber(value))
    @Min(1, { message: '每页显示数据必须大于1' })
    @IsNumber()
    @IsOptional()
    size?: number = 10;
}
