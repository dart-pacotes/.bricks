export interface Env {
    AWESOME_SECRET: string;
}

export interface Config {
    awesomeSecret: string;
}

export function fromEnv(env: Env): Config {
    return {
        awesomeSecret: env.AWESOME_SECRET,
    }
}