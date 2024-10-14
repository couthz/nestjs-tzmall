export class OrderDeliveryResultDTO {
    EBusinessID: string;

    OrderCode: string;

    ShipperCode: string;

    LogisticCode: string;

    Success: boolean;

    State: number;

    Reason: string;

    Traces: {
        AcceptTime: string;
        AcceptStation: string;
        Remark: string;
    }[];


}