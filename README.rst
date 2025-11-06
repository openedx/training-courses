Open edX Training Courses
#########################

Repo for course content and issues related to Open edX training courses. All courses licensed `Creative Commons Attribution-ShareAlike <https://creativecommons.org/licenses/by-sa/4.0/>`_.

Contents
********

This repository contains courses that you can import into your Open edX instance or take on `training.openedx.io`_.

* The ``.tar.gz`` files for you to import into Studio, located in the ``./dist/`` folder.
* The source code (a.k.a. "OLX") in the other top-level folders.

.. list-table::
   :header-rows: 1

   * - Name
     - Key
     - Download
     - Source OLX
   * - *Intro to Open edX*
     - ``course-v1:OpenedX+OEX101+2023``
     - `<./dist/Intro\ To\ Open\ edX\ Course.tar.gz>`_
     - `<./Intro\ To\ Open\ edX\ Course>`_
   * - *Open edX Developer Onboarding*
     - ``course-v1:OpenedX+OEX-Dev101+2024``
     - `<./dist/Open\ edX\ Developer\ Onboarding.tar.gz>`_
     - `<./Open\ edX\ Developer\ Onboarding>`_
   * - *OLX example course*
     - 
     - `<./dist/olx-example.tar.gz>`_
     - `<./olx-example>`_
   * *OLX example course*
     - ``course-v1:OpenedX+OLXex+2025``
     - `<./dist/OLX-example-course.tar.gz>`_
     - `<./OLX-example-course>`_
   * - *Core Contributor Onboarding Course*
     - ``course-v1:OpenedX+NewCC+2024``
     - `<./dist/Core\ Contributor\ Onboarding.tar.gz>`_
     - `<./Core\ Contributor\ Onboarding>`_


Contributing
************

Contributions of bug fixes are welcome. There are two ways you can make changes to this course.

If you make changes to the course or library OLX and want to re-generate the importable ``.tar.gz`` files, simply run::

  make dist

This will package the OLX into the ``dist`` directory.

OLX Editing
===========

If you are experienced with editing raw OLX, then you can make changes directly to the XML and asset files this repository. Before opening a pull request, please:

* Run ``make dist``, which will generate the ``dist/*.tar.gz`` archives. Include these changes in your commit.
* Import the updated ``dist/*.tar.gz`` archives into an Open edX Studio (as described above) and ensure the test course still works as expected, both in Studio and LMS.

Studio Editing
==============

Once you've imported the test course and libraries into an Open edX instance (as described above), you can edit the course and its libraries in Studio. Make sure to Publish any changes you make from Studio so that you can test them out in LMS.

When you're ready to contribute the changes back into this repository, simply:

1. Export the course and any libraries you changed.
2. Move to exported ``.tar.gz`` archives into this repository's ``dist/`` folder, and name them to match the top-level OLX folders. For example, the course archive should be named ``dist/demo-course.tar.gz``, and the problem bank archive should be named ``dist/demo-content-library.tar.gz``.
3. Run ``make unpack``, which will unpack the archives into OLX.
4. Review your OLX changes using ``git diff``.
5. Commit your changes and open a pull request.

All pull requests should pass the GitHub Actions suite, which ensures that the course and libraries can be imported into a freshly-provisioned Tutor instance.

License
*******

All content is made available under a `Creative Commons BY-NC-SA 3.0 US
License <http://creativecommons.org/licenses/by-nc-sa/3.0/us/>`_.

All code is made available under an `AGPLv3 License <./AGPL_LICENSE>`_