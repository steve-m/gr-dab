/* -*- c++ -*- */

%feature("autodoc", "1");		// generate python docstrings

%include "exception.i"
%import "gnuradio.i"			// the common stuff

%{
#include "gnuradio_swig_bug_workaround.h"	// mandatory bug fix
#include "dab_moving_sum_ff.h"
#include "dab_moving_sum_cc.h"
#include "dab_ofdm_sampler.h"
#include "dab_ofdm_coarse_frequency_correct.h"
#include "dab_diff_phasor_vcc.h"
#include <stdexcept>
%}

// ----------------------------------------------------------------

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 *
 * This does some behind-the-scenes magic so we can
 * access howto_square_ff from python as howto.square_ff
 */
GR_SWIG_BLOCK_MAGIC(dab,moving_sum_ff);

dab_moving_sum_ff_sptr dab_make_moving_sum_ff (int length);

class dab_moving_sum_ff : public gr_sync_block
{
 private:
  dab_moving_sum_ff (int length);

 public:
  int length() const {return d_length;}
  void set_length(int length) {set_history(length+1); d_length=length;}
};

// ----------------------------------------------------------------

/*
 * First arg is the package prefix.
 * Second arg is the name of the class minus the prefix.
 *
 * This does some behind-the-scenes magic so we can
 * access howto_square_ff from python as howto.square_ff
 */
GR_SWIG_BLOCK_MAGIC(dab,moving_sum_cc);

dab_moving_sum_cc_sptr dab_make_moving_sum_cc (int length);

class dab_moving_sum_cc : public gr_sync_block
{
 private:
  dab_moving_sum_cc (int length);

 public:
  int length() const {return d_length;}
  void set_length(int length) {set_history(length+1); d_length=length;}
};

// ----------------------------------------------------------------

GR_SWIG_BLOCK_MAGIC(dab,ofdm_sampler);

dab_ofdm_sampler_sptr dab_make_ofdm_sampler (unsigned int fft_length, unsigned int cp_length, unsigned int symbols_per_frame);

class dab_ofdm_sampler : public gr_block
{
 private:
  dab_ofdm_sampler (unsigned int fft_length, unsigned int cp_length, unsigned int symbols_per_frame);
};

// ----------------------------------------------------------------

GR_SWIG_BLOCK_MAGIC(dab,ofdm_coarse_frequency_correct);

dab_ofdm_coarse_frequency_correct_sptr dab_make_ofdm_coarse_frequency_correct (unsigned int fft_length, unsigned int num_carriers);

class dab_ofdm_coarse_frequency_correct : public gr_sync_block
{
 private:
  dab_ofdm_coarse_frequency_correct (unsigned int fft_length, unsigned int num_carriers);
};

// ----------------------------------------------------------------

GR_SWIG_BLOCK_MAGIC(dab,diff_phasor_vcc);

dab_diff_phasor_vcc_sptr dab_make_diff_phasor_vcc (unsigned int length);

class dab_diff_phasor_vcc : public gr_sync_block
{
 private:
  dab_diff_phasor_vcc (unsigned int length);
};