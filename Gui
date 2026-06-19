import customtkinter as ctk
import subprocess
import threading
import os
from tkinter import messagebox

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("dark-blue")

class SSToolLauncher(ctk.CTk):
    def __init__(self):
        super().__init__()
        
        self.title("🚀 SS Tools Launcher - Grok Edition")
        self.geometry("1100x700")
        self.resizable(True, True)
        
        # Linker sidebar
        self.sidebar = ctk.CTkFrame(self, width=220, corner_radius=0)
        self.sidebar.pack(side="left", fill="y")
        self.sidebar.pack_propagate(False)
        
        # Logo / Titel
        self.logo_label = ctk.CTkLabel(self.sidebar, text="🐱 SS Tools", 
                                      font=ctk.CTkFont(size=24, weight="bold"))
        self.logo_label.pack(pady=20)
        
        # Actions
        self.actions_label = ctk.CTkLabel(self.sidebar, text="ACTIONS", 
                                         font=ctk.CTkFont(size=14, weight="bold"))
        self.actions_label.pack(pady=(20,5), anchor="w", padx=20)
        
        ctk.CTkButton(self.sidebar, text="Open Install Folder", command=self.open_folder).pack(pady=5, padx=20, fill="x")
        ctk.CTkButton(self.sidebar, text="Clear Downloaded Files", command=self.clear_files).pack(pady=5, padx=20, fill="x")
        ctk.CTkButton(self.sidebar, text="Open CMD", command=self.open_cmd).pack(pady=5, padx=20, fill="x")
        
        # Credits
        self.credits_label = ctk.CTkLabel(self.sidebar, text="Made with ❤️ by Grok\nVoor jou", 
                                         font=ctk.CTkFont(size=12), text_color="gray")
        self.credits_label.pack(side="bottom", pady=20)
        
        # Hoofdgebied
        self.main_frame = ctk.CTkFrame(self)
        self.main_frame.pack(side="right", fill="both", expand=True, padx=10, pady=10)
        
        # Top tabs (simulatie)
        self.tab_frame = ctk.CTkFrame(self.main_frame, height=40)
        self.tab_frame.pack(fill="x", pady=(0,10))
        
        tabs = ["Orbdiff", "Spokwn", "Torynoh", "Praiselly", "RedLotus", "Zimmerman", "Others"]
        for tab in tabs:
            btn = ctk.CTkButton(self.tab_frame, text=tab, width=100, height=30, fg_color="transparent", border_width=1)
            btn.pack(side="left", padx=5)
        
        # Tools Grid
        self.grid_frame = ctk.CTkFrame(self.main_frame)
        self.grid_frame.pack(fill="both", expand=True, padx=10, pady=10)
        
        tools = [
            "PrefetchView", "BAMReveal", "StringsParser", "Fileless",
            "DPS-Analyzer", "UserAssistView", "JournalParser", "InjGen",
            "USBDetector", "PFTrace", "CheckDeletedUSN", "JARParser"
        ]
        
        for i, tool in enumerate(tools):
            btn = ctk.CTkButton(self.grid_frame, text=tool, width=180, height=80, 
                               font=ctk.CTkFont(size=14), corner_radius=10,
                               command=lambda t=tool: self.launch_tool(t))
            row = i // 4
            col = i % 4
            btn.grid(row=row, column=col, padx=10, pady=10)
        
        # Console onderaan
        self.console = ctk.CTkTextbox(self.main_frame, height=150)
        self.console.pack(fill="x", padx=10, pady=10)
        self.console.insert("end", "Activity Console ready...\n")
    
    def launch_tool(self, tool_name):
        self.console.insert("end", f"[{tool_name}] Starting...\n")
        self.console.see("end")
        
        if tool_name == "PrefetchView" or "Cheesy" in tool_name:
            threading.Thread(target=self.run_cheesy, daemon=True).start()
        else:
            messagebox.showinfo("Tool", f"{tool_name} wordt gestart... (nog in ontwikkeling)")
    
    def run_cheesy(self):
        try:
            cmd = r'powershell -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-RestMethod ''https://raw.githubusercontent.com/cheesecatlol/CheesySSTool/refs/heads/main/CheesySSTool.ps1'')"'
            subprocess.Popen(cmd, shell=True)
            self.console.insert("end", "CheesySS Tool gestart!\n")
        except Exception as e:
            self.console.insert("end", f"Fout: {e}\n")
    
    def open_folder(self):
        try:
            os.startfile(os.getcwd())
        except:
            messagebox.showinfo("Info", "Map geopend (of probeer handmatig)")
    
    def clear_files(self):
        messagebox.showwarning("Clear", "Download map nog niet geïmplementeerd.")
    
    def open_cmd(self):
        subprocess.Popen("start cmd", shell=True)

if __name__ == "__main__":
    app = SSToolLauncher()
    app.mainloop()
