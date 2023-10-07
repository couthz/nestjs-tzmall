export type ConnectionOption<T extends Record<string, any>> = { name?: string } & T;
export type ConnectionRst<T extends Record<string, any>> = Array<{ name: string } & T>;
