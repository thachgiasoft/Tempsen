﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ShineTech.TempCentre.BusinessFacade;
namespace ShineTech.TempCentre.DeviceManage
{
    public partial class UserProfile : Form
    {
        private UserProfileUI ui;
        public UserProfile()
        {
            InitializeComponent();
            ui = new UserProfileUI(this);
        }
        public UserProfile(string username)
        {
            InitializeComponent();
            ui = new UserProfileUI(this,username);
        }
    }
}
