classdef PlotOpts < Options.OptBase
%
% Package NILM_CEPEL.Options: Class PlotOpts
%   Define options to plot a generic NILM_CEPEL figure.
%
%   self = Options.PlotOpts(varargin)
%
%                         ------  Inputs  -------
%
%  -> files (int) <''>: The meterData files to use. If '' is
%  specified, then use all files.
%
%  -> phases (Phases object array) <''>: The phases to plot. If '' is
%  specified, then use all phases.
%
%  -> nTicks (int) <'auto'>: Number of x axis ticks.
%
%  -> FontSize (int) <14>: Size of text in the figure.
%
%  -> useCustomPlotArea (bool) <true>: Use custom size plot area
%  defined be the bottomBase topBase widthUsableArea leftBase
%  rightBase and heigthUsableArea properties.
%
%  -> bottomBase (double) <0.1>: If using custom plot area, define the
%  botton distance in percentage from the lowest axis start.
%
%  -> topBase (double) <0.95>: If using custom plot area, define the
%  top distance from bottom edge from the highest axis end.
%
%  -> widthUsableArea (double) <0.8>: If using custom plot area, the
%  width that the axis will ocuppy in between the specified bottom and
%  top base.
%
%  -> leftBase (double) <0.1>: If using custom plot area, define the
%  distance from the left corner from the start of the axis.
%
%  -> rightBase (double) <0.95>: If using custom plot, define the
%  distance, in percentage, from the left corner in which the last
%  plot will end.
%
%  -> heigthUsableArea (double) <0.8>: If using custom plot area, the
%  heigth that the axis will ocuppy in between the specified left and
%  right base.
%
%  -> useAdaptativeDateTicks (bool) <true>: Whether to use adaptative
%  date ticks.
%

% - Creation Date: Thu, 05 Sep 2013
% - Last Modified: Sun, 10 Aug 2014
% - Author(s): 
%   - W.S.Freund <wsfreund_at_gmail_dot_com>

  properties
    files = '';
    phases = '';
    nTicks = 'auto';
    FontSize = 14;
    useCustomPlotArea = true;
    bottomBase = 0;
    topBase = 1;
    widthUsableArea = 1;
    leftBase = 0;
    rightBase = 1;
    heigthUsableArea = 1;
    useAdaptativeDateTicks = true;
  end

  methods
    function self = PlotOpts(varargin)
      opts = Utils.parseOpts(varargin{:});
      names = fieldnames(opts);
      for field = names'
        self.(field{1}) = opts.(field{1});
      end
    end
  end
end


