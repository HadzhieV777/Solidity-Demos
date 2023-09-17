// custom.d.ts

declare module "ethers" {
    namespace ethers.providers {
      interface JsonRpcProvider {
        // Declare the missing 'providers' property with the correct type
        providers: {
          // Add any specific properties or methods you need to use from this interface
          // For example:
          // myCustomProviderMethod: () => void;
        };
      }
    }
  }

  // Add type declarations for EventEmitter
declare module "events" {
  class EventEmitter {
    addListener(event: string | symbol, listener: (...args: any[]) => void): this;
    on(event: string | symbol, listener: (...args: any[]) => void): this;
    once(event: string | symbol, listener: (...args: any[]) => void): this;
    removeListener(event: string | symbol, listener: (...args: any[]) => void): this;
    removeAllListeners(event?: string | symbol): this;
    emit(event: string | symbol, ...args: any[]): boolean;
  }
}