import SwiftUI

struct ContentView: View {
    @State private var messages: [String] = []
    @State private var isAnimating = false
    private let hackerMessages = [
        "[INFO] Initializing jailbreak sequence...",
        "[INFO] Bypassing security protocols...",
        "[INFO] Building Phys R/W Primitive...",
        "[INFO] Exploiting Kernel (step)...", // Exploit the kernel step moved up
        "[INFO] Bypassing PPL (step)...",
        "[INFO] Elevating Privileges...", // Elevate your access moved up
        "[INFO] Getting kcalling (allows running code in the kernel)...",
        "[INFO] Loading BaseBin TrustCache...",
        "[INFO] Applying necessary DYLD patches...",
        "[INFO] Injecting tweak into launchd for system wide tweak injection...", // Inject DYLD into launchd moved down
        "[INFO] Gaining root access...",
        "[INFO] Downloading payload...",
        "[INFO] Executing payload...",
        "[INFO] Jailbreak complete!",
        "[WARNING] Security breach detected...",
        "[INFO] Hiding traces...",
        "[INFO] Disabling alarms...",
        "[INFO] Transferring data...",
        "[SUCCESS] Data transfer complete.",
        "[INFO] Cleaning up...",
        "[INFO] Exiting...",
        "[INFO] Initializing Jailbreak Environment...",
        "[INFO] Initializing Protection...",
        "[INFO] Applying Bind Mount...",
        "[INFO] Removing Jailbreak...",
        "[INFO] Cleaning Up Exploits...",
        "[INFO] Rebooting Userspace...",
        "[INFO] Patchfinding...",
        "[INFO] Bypassing PAC (step)..."
    ]
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .id(message)
                    }
                }
                .background(Color.black)
                .padding(.top)
                .onChange(of: messages) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage, anchor: .bottom)
                        }
                    }
                }
            }
            
            Button(action: startHackerAnimation) {
                Text("Start")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    private func startHackerAnimation() {
        guard !isAnimating else { return }
        isAnimating = true
        messages = []
        var delay = 0.0
        for message in hackerMessages {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.easeIn(duration: 0.5)) {
                    self.messages.append(message)
                }
                if message == self.hackerMessages.last {
                    self.isAnimating = false
                }
            }
            delay += Double.random(in: 0.03...0.95)
        }
    }
}

@main
struct HackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
